# Keycloak Themes

A collection of custom Keycloak themes shared across multiple projects. Each theme is packaged into a single container image and loaded at runtime via Kubernetes init containers.

**Image:** `ghcr.io/bysamio/keycloak-themes`

## Available Themes

| Theme | Login | Email | Description |
|-------|:-----:|:-----:|-------------|
| `casepack` | — | — | Casepack application theme *(placeholder)* |
| `cmportal` | ✓ | ✓ | CM Portal branded login with Montserrat font and custom logo |

## Usage in Kubernetes

Use the image as an init container to copy a specific theme into an emptyDir volume, then mount that volume into the Keycloak pod:

```yaml
# ─── Custom Theme (init container) ──────────────────────────────
initContainers:
  - name: theme-loader
    image: ghcr.io/bysamio/keycloak-themes:0.2.0
    command: ["sh", "-c", "cp -r /themes/casepack /target/"]
    volumeMounts:
      - name: themes
        mountPath: /target

extraVolumes:
  - name: themes
    emptyDir: {}

extraVolumeMounts:
  - name: themes
    mountPath: /opt/keycloak/themes
    readOnly: true
```

To load **multiple themes** in the same pod:

```yaml
initContainers:
  - name: theme-loader
    image: ghcr.io/bysamio/keycloak-themes:0.2.0
    command: ["sh", "-c", "cp -r /themes/casepack /themes/cmportal /target/"]
    volumeMounts:
      - name: themes
        mountPath: /target
```

After deployment, select the theme in the Keycloak admin console under **Realm Settings → Themes**.

## Adding a New Theme

1. Create a directory under `themes/<name>/` with the standard [Keycloak theme structure](https://www.keycloak.org/docs/latest/server_development/#_themes):
   ```
   themes/<name>/
     login/
       theme.properties
       resources/
         css/
         img/
     email/
       theme.properties
   ```
2. Push to `main` — a snapshot image is built and published automatically.
3. Use the `Release` workflow to tag a stable version when ready.

## Local Development

### Prerequisites

A shared PostgreSQL instance must be running on the `devnet` Docker network. Create the database once:

```sh
psql -h localhost -U postgres -c "CREATE USER kc_themes WITH PASSWORD 'themes';"
psql -h localhost -U postgres -c "CREATE DATABASE kc_themes OWNER kc_themes;"
```

### Start Keycloak

```sh
docker compose -f docker-compose.dev.yaml up
```

Keycloak admin console: **http://localhost:8080** (admin / admin)

Themes are bind-mounted from `./themes`, so changes are reflected after a page refresh (no rebuild needed).

## Versioning

The `VERSION` file at the repository root tracks the current version.

| Context | Image tag example |
|---------|-------------------|
| Push to `main` | `0.2.0-SNAPSHOT-abc1234` |
| Release tag `v0.2.0` | `0.2.0`, `0.2`, `latest` |
| Manual dispatch | value provided in workflow input |

## CI/CD

| Workflow | Trigger | Purpose |
|----------|---------|---------|
| **build-publish** | Push to `main`, `v*` tag, manual | Build & push multi-arch image to GHCR |
| **release** | Manual dispatch | Bump VERSION, tag, create GitHub Release, then bump to next snapshot |
