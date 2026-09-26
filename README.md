# Keycloak Themes

Custom [Keycloak](https://www.keycloak.org/) login and email themes for bysam.io
projects. Every theme is packaged into a single container image and loaded into
Keycloak at runtime via a Kubernetes init container — no custom Keycloak build
required.

**Image:** [`ghcr.io/bysamio/keycloak-themes`](https://github.com/bysamio/keycloak-themes/pkgs/container/keycloak-themes)

## Available Themes

| Theme      | Login | Email | Description |
|------------|:-----:|:-----:|-------------|
| `casepack` |   ✓   |   ✓   | CasePack login built on Keycloak v2 (PatternFly 5), with light/dark mode synced to the CasePack app, plus branded transactional email templates. |
| `bursardesk` | ✓ | ✓ | BursarDesk login, registration, and account actions in the app's navy and emerald palette, plus branded email copy. |
| `cmportal` |   ✓   |   —   | CM Portal branded login (classic PatternFly) with the Montserrat font and custom logo. |

> ✓ = customised/branded, — = not provided.

The BursarDesk login theme targets Keycloak 26.7.4. Its `register.ftl` is a
small upstream override that skips password validation JavaScript when the
realm registers users before they set a password. Compare this file with the
bundled template on each Keycloak upgrade.

Each theme follows the standard
[Keycloak theme layout](https://www.keycloak.org/docs/latest/server_development/#_themes)
under `themes/<name>/`.

## How It Works

The image is a minimal filesystem containing every theme under `/themes/<name>`.
It is not a runnable service — it exists to be consumed as an **init container**
that copies one or more themes into a volume shared with the Keycloak pod:

```
keycloak-themes image ──(cp)──▶ emptyDir volume ──(mount)──▶ /opt/keycloak/themes
```

## Usage in Kubernetes

Add the image as an init container that copies a theme into an `emptyDir`
volume, then mount that volume into Keycloak at `/opt/keycloak/themes`:

```yaml
# ─── Custom Theme (init container) ──────────────────────────────
initContainers:
  - name: theme-loader
    image: ghcr.io/bysamio/keycloak-themes:0.5.0
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

To load **multiple themes** into the same pod, list them in the `cp` command:

```yaml
initContainers:
  - name: theme-loader
    image: ghcr.io/bysamio/keycloak-themes:0.5.0
    command: ["sh", "-c", "cp -r /themes/casepack /themes/cmportal /target/"]
    volumeMounts:
      - name: themes
        mountPath: /target
```

After deployment, select the theme in the Keycloak admin console under
**Realm Settings → Themes**.

> **Pin a release tag.** Replace `0.5.0` with the release you want — see
> [Versioning](#versioning) for the tags that are published. Avoid `latest`
> in production, as it tracks the `main` branch (development builds).

## Local Development

### Prerequisites

A shared PostgreSQL instance must be running on the `devnet` Docker network.
Create the database and user once:

```sh
psql -h localhost -U postgres -c "CREATE USER kc_themes WITH PASSWORD 'themes';"
psql -h localhost -U postgres -c "CREATE DATABASE kc_themes OWNER kc_themes;"
```

### Start Keycloak

```sh
docker compose -f docker-compose.dev.yaml up
```

Admin console: **http://localhost:8080** (`admin` / `admin`).

Themes are bind-mounted from `./themes`, so edits are picked up on a page
refresh — no rebuild needed.

## Adding a New Theme

1. Create `themes/<name>/` using the standard Keycloak theme structure:
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
2. Open a pull request. The CI pipeline validates that the image builds.
3. Once merged to `main`, a development (`-SNAPSHOT`) image is published
   automatically.
4. Cut a stable version with the **Release** workflow when ready.

## Versioning

The `VERSION` file at the repository root tracks the current version. Images
are published to GHCR with the following tags:

| Context           | Example tags                          | Use for       |
|-------------------|---------------------------------------|---------------|
| Release tag `v0.5.0` | `0.5.0`, `0.5`                     | Production    |
| Push to `main`    | `0.6.0-SNAPSHOT-<sha>`, `<sha>`, `latest` | Development |

Release tags are recommended for production. `latest` always
points at the most recent `main` build. The publish job verifies each tag can
be read back from GHCR after pushing it.

### Publishing a release

Run the **Release** workflow (Actions → Release → *Run workflow*) with the
target version. It bumps `VERSION`, creates the git tag and GitHub Release,
builds the multi-arch (`amd64` + `arm64`) image, and bumps `main` to the next
`-SNAPSHOT`.

## License

Proprietary and source-available — see [LICENSE](LICENSE). These themes are
published so that licensed customers can deploy them alongside bysam.io's
commercial products in self-hosted environments. They are **not** open source,
and all other rights, including brand assets and trademarks, are reserved.
For licensing enquiries, contact admin@bysam.io.

## Image scan alerts

If a scanner reports `image not found`, verify the exact tag first with
`docker manifest inspect ghcr.io/bysamio/keycloak-themes:<tag>` and check the
corresponding GitHub Actions release run. The `0.5.0` tag was verified as a
multi-architecture GHCR image on 2026-09-27. An alert that names a different
package (for example `casepack:0.7.0`) alongside this image needs its scanner
association or scheduled scan target checked; the theme image itself has no
CasePack package version. Do not delete or republish an existing release tag
solely in response to that alert.
