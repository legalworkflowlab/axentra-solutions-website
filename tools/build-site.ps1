$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$Root = Split-Path -Parent $PSScriptRoot
$BasePath = '/axentra-solutions-website'
$SiteUrl = 'https://legalworkflowlab.github.io/axentra-solutions-website'
$GeneralEmail = 'info@axentrabusiness.com'
$LinkedInUrl = 'https://www.linkedin.com/company/axentra-solutions-pvt-ltd/'
$OgImage = "$SiteUrl/assets/axentra-operations-visual.jpg"
$Utf8NoBom = [Text.UTF8Encoding]::new($false)

function Write-SiteFile {
  param(
    [Parameter(Mandatory)][string]$Path,
    [Parameter(Mandatory)][string]$Content
  )

  $fullPath = Join-Path $Root ($Path -replace '/', '\')
  $directory = Split-Path -Parent $fullPath
  if ($directory -and -not (Test-Path -LiteralPath $directory)) {
    New-Item -ItemType Directory -Path $directory -Force | Out-Null
  }

  [IO.File]::WriteAllText($fullPath, $Content.TrimStart(), $Utf8NoBom)
}

function Get-ActiveAttribute {
  param([string]$Active, [string]$Name)
  if ($Active -eq $Name) { return ' class="active" aria-current="page"' }
  return ''
}

function Get-Header {
  param([string]$Active = '')

  $homeCurrent = Get-ActiveAttribute $Active 'home'
  $workCurrent = Get-ActiveAttribute $Active 'work'
  $securityCurrent = Get-ActiveAttribute $Active 'security'
  $aboutCurrent = Get-ActiveAttribute $Active 'about'
  $insightsCurrent = Get-ActiveAttribute $Active 'insights'
  $faqsCurrent = Get-ActiveAttribute $Active 'faqs'
  $contactCurrent = Get-ActiveAttribute $Active 'contact'
  $servicesClass = if ($Active -eq 'services') { ' active' } else { '' }
  $servicesCurrent = if ($Active -eq 'services') { ' aria-current="page"' } else { '' }

  return @"
<header class="site-header">
  <div class="container nav-shell">
    <a class="brand" href="$BasePath/" aria-label="Axentra Solutions home">
      <img src="$BasePath/assets/images/axentra-solutions-logo.jpeg" alt="Axentra Solutions" width="1600" height="600" />
    </a>
    <button class="nav-toggle" type="button" aria-expanded="false" aria-controls="primary-nav" aria-label="Open navigation">
      <span></span><span></span><span></span>
    </button>
    <nav class="primary-nav" id="primary-nav" aria-label="Primary navigation">
      <a href="$BasePath/"$homeCurrent>Home</a>
      <div class="services-menu">
        <button class="services-toggle$servicesClass" type="button" aria-expanded="false" aria-controls="services-menu-panel"$servicesCurrent>
          Services <span class="menu-chevron" aria-hidden="true"></span>
        </button>
        <div class="services-panel" id="services-menu-panel">
          <div class="services-panel-intro">
            <span>Alternative legal and business process services</span>
            <strong>Five primary service areas</strong>
            <a href="$BasePath/services/">View service overview</a>
            <a href="$BasePath/services/workflow-assessment.html">Explore Workflow Assessment</a>
          </div>
          <div class="services-panel-links">
            <a href="$BasePath/services/bankruptcy-operations.html"><strong>Bankruptcy Operations</strong><span>Pre-filing through post-filing support</span></a>
            <a href="$BasePath/services/mortgage-servicing-default-operations.html"><strong>Mortgage Servicing and Default</strong><span>Loan records, default and bankruptcy interface</span></a>
            <a href="$BasePath/services/contract-commercial-operations.html"><strong>Contract and Commercial</strong><span>Contracts and commercial data</span></a>
            <a href="$BasePath/services/legal-tech-ai-quality-support.html"><strong>Legal Tech and AI Quality Support</strong><span>Business-user testing and AI quality review</span></a>
            <a href="$BasePath/services/defined-legal-support.html"><strong>Defined Legal Support</strong><span>Research, review and structured reporting</span></a>
          </div>
        </div>
      </div>
      <a href="$BasePath/how-we-work.html"$workCurrent>How We Work</a>
      <a href="$BasePath/security-trust.html"$securityCurrent>Security &amp; Trust</a>
      <a href="$BasePath/about.html"$aboutCurrent>About</a>
      <a href="$BasePath/insights/"$insightsCurrent>Insights</a>
      <a href="$BasePath/faqs.html"$faqsCurrent>FAQs</a>
      <a class="nav-contact" href="$BasePath/contact.html"$contactCurrent>Contact</a>
    </nav>
  </div>
</header>
"@
}

function Get-Footer {
  return @"
<footer class="site-footer">
  <div class="container footer-grid">
    <div class="footer-brand">
      <a href="$BasePath/" aria-label="Axentra Solutions home">
        <img src="$BasePath/assets/images/axentra-solutions-logo.jpeg" alt="Axentra Solutions" width="1600" height="600" loading="lazy" />
      </a>
      <p class="footer-company">Axentra Solutions Pvt. Ltd.</p>
      <p>Alternative legal and business process services for clients in India and international markets.</p>
    </div>
    <div class="footer-column">
      <h2>Navigate</h2>
      <a href="$BasePath/services/">Services</a>
      <a href="$BasePath/about.html">About</a>
      <a href="$BasePath/contact.html">Contact</a>
    </div>
    <div class="footer-column">
      <h2>Trust</h2>
      <a href="$BasePath/security-trust.html">Security &amp; Trust</a>
      <a href="$BasePath/privacy-notice.html">Privacy Notice</a>
      <a href="$BasePath/legal-notice.html">Legal Notice</a>
    </div>
    <div class="footer-column">
      <h2>Contact</h2>
      <a href="mailto:$GeneralEmail">$GeneralEmail</a>
      <a href="$LinkedInUrl" target="_blank" rel="noopener noreferrer">Axentra on LinkedIn</a>
      <a href="$BasePath/contact.html">Speak With Axentra</a>
    </div>
  </div>
  <div class="footer-base">
    <div class="container footer-base-inner">
      <p>&copy; 2026 Axentra Solutions Pvt. Ltd.</p>
      <p>India-based delivery for clients in India and international markets.</p>
    </div>
  </div>
</footer>
"@
}

function Get-Page {
  param(
    [Parameter(Mandatory)][string]$Title,
    [Parameter(Mandatory)][string]$Description,
    [Parameter(Mandatory)][string]$Canonical,
    [string]$Active = '',
    [Parameter(Mandatory)][string]$Main,
    [string]$BodyClass = '',
    [string]$AdditionalHead = '',
    [switch]$NoIndex
  )

  $robotsMeta = if ($NoIndex) { '    <meta name="robots" content="noindex, nofollow" />' } else { '    <meta name="robots" content="index, follow" />' }

  return @"
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="$Description" />
$robotsMeta
    <link rel="canonical" href="$Canonical" />
    <meta property="og:type" content="website" />
    <meta property="og:site_name" content="Axentra Solutions" />
    <meta property="og:title" content="$Title" />
    <meta property="og:description" content="$Description" />
    <meta property="og:url" content="$Canonical" />
    <meta property="og:image" content="$OgImage" />
    <meta property="og:image:alt" content="Legal and business process teams reviewing documents and workflow information" />
    <meta name="twitter:card" content="summary_large_image" />
    <title>$Title</title>
    <link rel="stylesheet" href="$BasePath/styles.css" />
$AdditionalHead
  </head>
  <body class="$BodyClass">
    <a class="skip-link" href="#main-content">Skip to content</a>
    $(Get-Header -Active $Active)
    <main id="main-content">
$Main
    </main>
    $(Get-Footer)
    <script src="$BasePath/script.js"></script>
  </body>
</html>
"@
}

function Get-RedirectPage {
  param(
    [Parameter(Mandatory)][string]$Title,
    [Parameter(Mandatory)][string]$Description,
    [Parameter(Mandatory)][string]$Canonical,
    [Parameter(Mandatory)][string]$Target,
    [Parameter(Mandatory)][string]$Heading,
    [Parameter(Mandatory)][string]$Copy,
    [Parameter(Mandatory)][string]$LinkLabel
  )

  return @"
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="$Description" />
    <meta name="robots" content="noindex, follow" />
    <link rel="canonical" href="$Canonical" />
    <meta http-equiv="refresh" content="0; url=$Target" />
    <title>$Title</title>
    <link rel="stylesheet" href="$BasePath/styles.css" />
    <script>window.location.replace('$Target');</script>
  </head>
  <body>
    <main class="redirect-page" id="main-content">
      <div class="redirect-panel">
        <a class="redirect-logo" href="$BasePath/"><img src="$BasePath/assets/images/axentra-solutions-logo.jpeg" alt="Axentra Solutions" width="1600" height="600" /></a>
        <p class="eyebrow">Page updated</p>
        <h1>$Heading</h1>
        <p>$Copy</p>
        <a class="button primary" href="$Target">$LinkLabel</a>
      </div>
    </main>
  </body>
</html>
"@
}

function Get-ListMarkup {
  param([Parameter(Mandatory)][string[]]$Items, [string]$ClassName = 'scope-list')
  $itemsMarkup = ($Items | ForEach-Object { "<li>$_</li>" }) -join "`n"
  return '<ul class="{0}">{1}</ul>' -f $ClassName, $itemsMarkup
}

function Get-ProcessMarkup {
  param(
    [Parameter(Mandatory)][string[]]$Items,
    [Parameter(Mandatory)][string]$Label,
    [string]$ClassName = ''
  )

  $index = 0
  $itemsMarkup = ($Items | ForEach-Object {
    $index++
    '<li><span class="process-number">{0:D2}</span><strong>{1}</strong></li>' -f $index, $_
  }) -join "`n"

  return '<ol class="process-flow {0}" aria-label="{1}">{2}</ol>' -f $ClassName, $Label, $itemsMarkup
}

function Get-ScopePanel {
  param(
    [Parameter(Mandatory)][string]$Title,
    [Parameter(Mandatory)][string[]]$Items,
    [string]$Intro = '',
    [switch]$Open
  )

  $openAttribute = if ($Open) { ' open' } else { '' }
  $introMarkup = if ($Intro) { "<p>$Intro</p>" } else { '' }
  return @"
<details class="scope-panel"$openAttribute>
  <summary><span>$Title</span><span class="summary-marker" aria-hidden="true"></span></summary>
  <div class="scope-panel-body">$introMarkup$(Get-ListMarkup -Items $Items)</div>
</details>
"@
}

function Get-ContactBand {
  param(
    [string]$Eyebrow = 'Speak with Axentra',
    [string]$Heading = 'Discuss the support your team needs',
    [string]$Copy = 'Tell us about the work, expected volumes, timing, systems and team coverage you are considering.'
  )

  return @"
<section class="contact-band">
  <div class="container contact-band-inner">
    <div><p class="eyebrow">$Eyebrow</p><h2>$Heading</h2><p>$Copy</p></div>
    <a class="button light" href="$BasePath/contact.html">Discuss Your Requirement</a>
  </div>
</section>
"@
}

. (Join-Path $PSScriptRoot 'pages-services.ps1')
. (Join-Path $PSScriptRoot 'pages-site.ps1')
. (Join-Path $PSScriptRoot 'pages-faqs.ps1')
. (Join-Path $PSScriptRoot 'pages-legacy.ps1')

"Generated the Axentra website at $Root"
