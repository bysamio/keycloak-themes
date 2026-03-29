<#macro emailLayout>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>${msg("emailTitle","CasePack")}</title>
  <!--[if mso]>
  <noscript>
    <xml>
      <o:OfficeDocumentSettings>
        <o:PixelsPerInch>96</o:PixelsPerInch>
      </o:OfficeDocumentSettings>
    </xml>
  </noscript>
  <![endif]-->
  <style>
    /* Reset */
    body, table, td, a { -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; }
    table, td { mso-table-lspace: 0pt; mso-table-rspace: 0pt; }
    img { -ms-interpolation-mode: bicubic; border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none; }
    body { margin: 0; padding: 0; width: 100% !important; height: 100% !important; }

    /* Theme */
    body {
      background-color: #f4f4f5;
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Inter', sans-serif;
      color: #1e2128;
    }
    .email-wrapper {
      width: 100%;
      background-color: #f4f4f5;
      padding: 40px 0;
    }
    .email-container {
      max-width: 520px;
      margin: 0 auto;
      background-color: #ffffff;
      border: 1px solid #e2e3e8;
      border-radius: 16px;
      overflow: hidden;
    }
    .email-header {
      text-align: center;
      padding: 32px 32px 24px;
      border-bottom: 1px solid #e2e3e8;
    }
    .email-logo-icon {
      width: 40px;
      height: 40px;
      margin-bottom: 4px;
    }
    .email-logo-text {
      font-size: 20px;
      font-weight: 700;
      color: #1e2128;
      letter-spacing: -0.025em;
    }
    .email-body {
      padding: 32px;
    }
    .email-body p {
      font-size: 15px;
      line-height: 1.6;
      color: #374151;
      margin: 0 0 16px;
    }
    .email-cta {
      display: inline-block;
      background-color: #2563eb;
      color: #ffffff !important;
      font-size: 14px;
      font-weight: 600;
      text-decoration: none;
      padding: 12px 28px;
      border-radius: 8px;
      margin: 8px 0 16px;
    }
    .email-cta:hover {
      background-color: #1d4ed8;
    }
    .email-link-fallback {
      font-size: 13px;
      color: #6b7280;
      word-break: break-all;
    }
    .email-link-fallback a {
      color: #2563eb;
      text-decoration: none;
    }
    .email-footer {
      text-align: center;
      padding: 20px 32px;
      border-top: 1px solid #e2e3e8;
    }
    .email-footer p {
      font-size: 12px;
      color: #9ca3af;
      margin: 0;
      line-height: 1.5;
    }
    .email-footer a {
      color: #6b7280;
      text-decoration: none;
    }
  </style>
</head>
<body>
  <div class="email-wrapper">
    <table role="presentation" cellspacing="0" cellpadding="0" border="0" align="center" width="100%" style="max-width: 520px;">
      <tr>
        <td>
          <div class="email-container">
            <!-- Header -->
            <div class="email-header">
              <img class="email-logo-icon"
                   src="https://casepack.app/favicon.svg"
                   alt="CasePack"
                   width="40" height="40"
                   style="width:40px;height:40px;margin-bottom:4px;">
              <div class="email-logo-text">CasePack</div>
            </div>
            <!-- Body -->
            <div class="email-body">
              <#nested>
            </div>
            <!-- Footer -->
            <div class="email-footer">
              <p>&copy; ${.now?string("yyyy")} <a href="https://casepack.app">CasePack</a> &mdash; Incident evidence packs for MSPs.</p>
            </div>
          </div>
        </td>
      </tr>
    </table>
  </div>
</body>
</html>
</#macro>
