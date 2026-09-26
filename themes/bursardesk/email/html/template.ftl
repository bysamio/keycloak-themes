<#macro emailLayout>
<!doctype html>
<html lang="${locale.language}" dir="${(ltr)?then('ltr','rtl')}">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>BursarDesk</title>
</head>
<body style="margin:0;padding:32px 16px;background:#f6f8fb;color:#0f1e33;font-family:Arial,Helvetica,sans-serif;">
  <table role="presentation" cellspacing="0" cellpadding="0" style="width:100%;max-width:560px;margin:0 auto;background:#ffffff;border:1px solid #e2e8f0;border-radius:12px;">
    <tr>
      <td style="padding:28px 32px;border-top:4px solid #059669;border-bottom:1px solid #e2e8f0;">
        <strong style="font-size:22px;letter-spacing:-.03em;color:#0f1e33;">BursarDesk</strong><br>
        <span style="font-size:12px;color:#5b6b82;">School Finance</span>
      </td>
    </tr>
    <tr>
      <td style="padding:28px 32px;font-size:15px;line-height:1.65;overflow-wrap:anywhere;">
        <#nested>
      </td>
    </tr>
    <tr>
      <td style="padding:18px 32px;border-top:1px solid #e2e8f0;color:#5b6b82;font-size:12px;line-height:1.5;">
        BursarDesk &middot; School finance, clearly in hand.
      </td>
    </tr>
  </table>
</body>
</html>
</#macro>
