$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$PrototypeRoot = $PSScriptRoot
$PrototypeUrl = 'https://legalworkflowlab.github.io/axentra-solutions-website/prototype-v2'
$GeneralEmail = 'info@axentrabusiness.com'
$LinkedInUrl = 'https://www.linkedin.com/company/axentra-solutions-pvt-ltd/'
$Utf8NoBom = [Text.UTF8Encoding]::new($false)

function Write-PrototypeFile {
  param(
    [Parameter(Mandatory)][string]$Path,
    [Parameter(Mandatory)][string]$Content
  )

  $fullPath = [IO.Path]::GetFullPath((Join-Path $PrototypeRoot ($Path -replace '/', '\')))
  $rootPath = [IO.Path]::GetFullPath($PrototypeRoot).TrimEnd('\') + '\'
  if (-not $fullPath.StartsWith($rootPath, [StringComparison]::OrdinalIgnoreCase)) {
    throw "Prototype build attempted to write outside prototype-v2: $Path"
  }

  $directory = Split-Path -Parent $fullPath
  if (-not (Test-Path -LiteralPath $directory)) {
    New-Item -ItemType Directory -Path $directory -Force | Out-Null
  }

  [IO.File]::WriteAllText($fullPath, $Content.TrimStart(), $Utf8NoBom)
}

$Services = @(
  [pscustomobject]@{
    Number = '01'
    Slug = 'bankruptcy-operations'
    Name = 'Bankruptcy Operations'
    Family = 'Legal and matter operations'
    Short = 'Pre-filing preparation, calculations, filing readiness and post-filing tracking for debtor, creditor, lender and servicer workflows.'
    Fit = 'For law firms, creditors, lenders and servicers that need defined bankruptcy preparation or case-event work delivered within authorised systems, instructions and legal review.'
    Activities = @(
      'Intake and document collation',
      'Income and expense worksheet preparation',
      'Means-test and schedule preparation under attorney instructions',
      'Creditor matrix and filing-readiness checks',
      'Filed-case setup and docket tracking',
      'Trustee request, hearing and deadline tracking',
      'Claims and proof-of-claim package preparation',
      'Amendment, payment and case-closure records'
    )
    Outputs = @(
      'Intake and missing-item tracker',
      'Calculation worksheets',
      'Attorney-review package',
      'Filing-readiness checklist',
      'Docket and deadline register',
      'Claims and case-status reporting'
    )
    Client = @(
      'Jurisdiction, legal treatment and approved methods',
      'Chapter selection, eligibility and exemptions',
      'Legal conclusions and litigation decisions',
      'Signature, filing approval and court representation'
    )
    Boundary = 'Axentra is not a law firm. Legal advice, eligibility decisions, exemptions, filing approval, signatures and representation remain with the client and its authorised professionals.'
    Related = @('mortgage-default-foreclosure', 'case-matter-records')
  },
  [pscustomobject]@{
    Number = '02'
    Slug = 'mortgage-default-foreclosure'
    Name = 'Mortgage, Default and Foreclosure Operations'
    Family = 'Regulated and business operations'
    Short = 'Loan-record review, account reconciliation, delinquency, loss-mitigation administration, foreclosure tracking, bankruptcy and post-foreclosure records.'
    Fit = 'For lenders, servicers, counsel and related providers that need document, calculation, milestone and exception records maintained across default-related workflows.'
    Activities = @(
      'Loan and collateral document review',
      'Principal, interest, escrow and arrears reconciliation',
      'Delinquency and notice records',
      'Loss-mitigation package administration',
      'Foreclosure referral and milestone tracking',
      'Bankruptcy notice and claim records',
      'Post-foreclosure title, expense and recovery records',
      'File closure and retention tracking'
    )
    Outputs = @(
      'Document exception register',
      'Account reconciliation worksheets',
      'Loss-mitigation document tracker',
      'Foreclosure milestone report',
      'Bankruptcy and claim record',
      'Post-foreclosure closure package'
    )
    Client = @(
      'Servicing methods and investor requirements',
      'Credit and loss-mitigation decisions',
      'Borrower communication and collection authority',
      'Foreclosure strategy, pleadings and legal decisions'
    )
    Boundary = 'Axentra does not act as a lender, licensed mortgage servicer, debt collector, foreclosure counsel, title adviser, broker or asset manager. Decisions remain with the authorised client, investor, provider or counsel.'
    Related = @('bankruptcy-operations', 'property-lease-operations')
  },
  [pscustomobject]@{
    Number = '03'
    Slug = 'contract-commercial-operations'
    Name = 'Contract and Commercial Operations'
    Family = 'Legal and matter operations'
    Short = 'Contract intake, approved-template drafting, review coordination, execution, repositories, obligations, amendments and commercial data.'
    Fit = 'For legal, procurement, finance, commercial and property teams that need contract work and post-signature records delivered through an agreed playbook.'
    Activities = @(
      'Request intake and document checks',
      'Drafting from approved templates and instructions',
      'Clause comparison and deviation records',
      'Redline, approval and signature coordination',
      'Repository and metadata maintenance',
      'Obligation, renewal and amendment tracking',
      'Fee, pricing, rebate and revenue-share abstraction',
      'Commercial condition and dependency records'
    )
    Outputs = @(
      'Contract intake queue',
      'Draft and comparison package',
      'Approval and signature tracker',
      'Contract metadata record',
      'Obligation and renewal register',
      'Commercial-data report'
    )
    Client = @(
      'Approved templates, playbooks and positions',
      'Negotiating authority and legal judgement',
      'Commercial approval and final signature',
      'Repository ownership and obligation decisions'
    )
    Boundary = 'Drafting and review preparation follow client-approved templates, playbooks and instructions. Legal judgement, negotiating positions, commercial approval and signature remain with the client.'
    Related = @('deal-transaction-operations', 'property-lease-operations')
  },
  [pscustomobject]@{
    Number = '04'
    Slug = 'ediscovery-investigations'
    Name = 'eDiscovery, Investigations and Document Review'
    Family = 'Legal and matter operations'
    Short = 'Document-review workflows organised around collection records, review protocols, issue coding, privilege indicators, quality checks and escalation.'
    Fit = 'For law firms, in-house teams and investigation functions that need document populations prepared, reviewed and reported under a client-approved protocol.'
    Activities = @(
      'Document population and source inventory',
      'Review-set organisation',
      'Protocol-based relevance and issue coding',
      'Privilege indicator review',
      'Chronology and key-document records',
      'Quality sampling and rework tracking',
      'Exception and escalation management',
      'Review progress and completion reporting'
    )
    Outputs = @(
      'Source and collection register',
      'Review protocol checklist',
      'Issue and key-document log',
      'Privilege indicator queue',
      'Quality findings report',
      'Review status dashboard'
    )
    Client = @(
      'Collection method, hosting environment and review protocol',
      'Responsiveness, privilege and legal determinations',
      'Investigation strategy and interview decisions',
      'Production approval and regulatory or court submissions'
    )
    Boundary = 'The prototype describes workflow and document-review delivery. Forensic collection, legal determinations, investigation strategy, privilege decisions and production approval remain with authorised client professionals and providers.'
    Related = @('case-matter-records', 'deal-transaction-operations')
  },
  [pscustomobject]@{
    Number = '05'
    Slug = 'compliance-governance-privacy'
    Name = 'Compliance, Governance and Privacy'
    Family = 'Regulated and business operations'
    Short = 'Registers, documentation and recurring administration for governance, policy, compliance and privacy workflows.'
    Fit = 'For legal, compliance, privacy and business teams that need recurring obligations, requests, findings and remediation records maintained through a defined process.'
    Activities = @(
      'Obligation and requirement registers',
      'Policy and acknowledgement records',
      'Control and responsibility mapping',
      'Regulatory-change intake and routing',
      'Privacy-request administration',
      'Assessment and diligence document coordination',
      'Finding and remediation tracking',
      'Governance reporting preparation'
    )
    Outputs = @(
      'Obligation register',
      'Policy record',
      'Responsibility matrix',
      'Request and deadline tracker',
      'Remediation log',
      'Governance status report'
    )
    Client = @(
      'Applicable laws, regulations and internal standards',
      'Risk acceptance and compliance decisions',
      'Legal interpretation and regulator engagement',
      'Policy approval and remediation ownership'
    )
    Boundary = 'Axentra records and administers work under client requirements. Legal interpretation, compliance decisions, risk acceptance, regulator engagement and policy approval remain with the client and its advisers.'
    Related = @('kyc-aml-onboarding', 'process-sop-quality')
  },
  [pscustomobject]@{
    Number = '06'
    Slug = 'case-matter-records'
    Name = 'Case, Matter and Records Operations'
    Family = 'Legal and matter operations'
    Short = 'Matter intake, records, dates, correspondence, document indexing, status reporting and closure administration.'
    Fit = 'For law firms and in-house teams that need matter information organised for retrieval, daily work, review and reporting.'
    Activities = @(
      'Matter opening and intake checks',
      'Document and correspondence indexing',
      'Calendar, deadline and milestone records',
      'Task and responsibility tracking',
      'Docket and case-status updates',
      'Chronology and key-event records',
      'Records request and retrieval administration',
      'Matter closure and retention preparation'
    )
    Outputs = @(
      'Matter intake record',
      'Document index',
      'Deadline register',
      'Task and owner tracker',
      'Matter status report',
      'Closure checklist'
    )
    Client = @(
      'Matter strategy and legal priorities',
      'Deadline interpretation and legal decisions',
      'Communication approval and authority',
      'Retention requirements and closure approval'
    )
    Boundary = 'Matter administration does not include legal representation or independent legal decisions. Strategy, legal conclusions, communications and final approvals remain with authorised client professionals.'
    Related = @('ediscovery-investigations', 'bankruptcy-operations')
  },
  [pscustomobject]@{
    Number = '07'
    Slug = 'finance-invoicing-legal-spend'
    Name = 'Finance, Invoicing and Legal Spend Operations'
    Family = 'Regulated and business operations'
    Short = 'Invoice intake, billing-guideline checks, accrual records, matter budgets, spend classification, exceptions and reporting.'
    Fit = 'For legal, finance and procurement teams that need invoice and spend workflows administered against client rules and approval routes.'
    Activities = @(
      'Invoice intake and data validation',
      'Billing-guideline and rate checks',
      'Matter and purchase-order matching',
      'Exception and correction queues',
      'Accrual and forecast data preparation',
      'Budget and spend classification',
      'Approval and payment-status tracking',
      'Spend and variance reporting'
    )
    Outputs = @(
      'Invoice validation queue',
      'Billing exception register',
      'Accrual record',
      'Budget and variance tracker',
      'Approval status report',
      'Legal spend analysis file'
    )
    Client = @(
      'Billing guidelines, rates and approval thresholds',
      'Budget ownership and financial decisions',
      'Payment approval and supplier communication',
      'Accounting treatment, tax and audit conclusions'
    )
    Boundary = 'Axentra performs data preparation and workflow administration under client rules. Payment approval, accounting treatment, tax, audit and financial decisions remain with the client.'
    Related = @('contract-commercial-operations', 'deal-transaction-operations')
  },
  [pscustomobject]@{
    Number = '08'
    Slug = 'kyc-aml-onboarding'
    Name = 'KYC, KYB, AML and Onboarding'
    Family = 'Regulated and business operations'
    Short = 'Document collection, checklist validation, ownership records, screening-result administration, refresh cycles and exception routing.'
    Fit = 'For regulated and commercial teams that need customer, counterparty or supplier onboarding information processed through client-approved rules and systems.'
    Activities = @(
      'Customer and business document collection',
      'Identity and entity checklist validation',
      'Beneficial-ownership data preparation',
      'Screening-result recording in client tools',
      'Missing-information and expiry tracking',
      'Risk-factor and exception routing',
      'Periodic review and refresh administration',
      'Onboarding status and ageing reporting'
    )
    Outputs = @(
      'Onboarding checklist',
      'Document exception queue',
      'Ownership record',
      'Screening-result file',
      'Refresh tracker',
      'Onboarding status report'
    )
    Client = @(
      'Applicable programme rules and risk factors',
      'Screening tools, lists and matching thresholds',
      'Risk classification and acceptance decisions',
      'Escalation, reporting and regulatory decisions'
    )
    Boundary = 'Axentra administers onboarding data and records under client-approved rules. Identity certification, screening methodology, risk classification, acceptance and regulatory reporting decisions remain with the authorised client.'
    Related = @('compliance-governance-privacy', 'contract-commercial-operations')
  },
  [pscustomobject]@{
    Number = '09'
    Slug = 'property-lease-operations'
    Name = 'Property and Lease Operations'
    Family = 'Regulated and business operations'
    Short = 'Lease abstraction, critical dates, rent and charge data, obligations, notices, amendments and property records.'
    Fit = 'For legal, property, finance and commercial teams that need lease and property information maintained for recurring administration and reporting.'
    Activities = @(
      'Lease and amendment abstraction',
      'Rent, charge and escalation records',
      'Critical-date and notice tracking',
      'Option, break and renewal records',
      'Insurance and certificate administration',
      'Landlord and tenant obligation records',
      'Property document indexing',
      'Portfolio and exception reporting'
    )
    Outputs = @(
      'Lease abstract',
      'Critical-date register',
      'Rent and charge schedule',
      'Obligation tracker',
      'Property document index',
      'Portfolio status report'
    )
    Client = @(
      'Lease interpretation and approved abstraction rules',
      'Accounting treatment and payment decisions',
      'Notice approval and legal positions',
      'Property, brokerage and asset-management decisions'
    )
    Boundary = 'Axentra prepares records under client-approved rules. Lease interpretation, legal positions, accounting treatment, payments, brokerage, property management and asset decisions remain with the client and authorised providers.'
    Related = @('contract-commercial-operations', 'mortgage-default-foreclosure')
  },
  [pscustomobject]@{
    Number = '10'
    Slug = 'deal-transaction-operations'
    Name = 'Deal and Transaction Operations'
    Family = 'Legal and matter operations'
    Short = 'Diligence records, data-room organisation, issue tracking, document comparison, closing checklists and post-close actions.'
    Fit = 'For legal, finance, investment and commercial teams that need transaction documents and workstreams organised for review and completion.'
    Activities = @(
      'Data-room and document index administration',
      'Diligence request and response tracking',
      'Document review and classification',
      'Issue, exception and dependency logs',
      'Document comparison and summary preparation',
      'Conditions-precedent and approval tracking',
      'Signature and closing checklist administration',
      'Post-close obligation and deliverable tracking'
    )
    Outputs = @(
      'Data-room index',
      'Diligence tracker',
      'Issue and exception log',
      'Document comparison package',
      'Closing checklist',
      'Post-close action register'
    )
    Client = @(
      'Transaction scope and diligence priorities',
      'Materiality, risk and legal conclusions',
      'Negotiating positions and commercial decisions',
      'Signing, closing and regulatory approvals'
    )
    Boundary = 'Axentra organises transaction workflows and prepares review records. Materiality, legal conclusions, negotiation, risk acceptance, signing and closing decisions remain with the client and its advisers.'
    Related = @('contract-commercial-operations', 'ediscovery-investigations')
  },
  [pscustomobject]@{
    Number = '11'
    Slug = 'legal-technology-ai-workflows'
    Name = 'Legal Technology and AI Workflows'
    Family = 'Technology, process and quality'
    Short = 'Business-user testing, workflow validation and human review of AI-extracted clauses, data, summaries and user-facing outputs.'
    Fit = 'For legal, contract and property technology teams that need configured workflows tested from the business-user perspective and AI outputs checked against source documents.'
    Activities = @(
      'Agreed user-journey testing',
      'Document upload and data-field validation',
      'Workflow routing, approval and alert testing',
      'AI clause and field validation',
      'AI summary review against source documents',
      'Issue and correction records',
      'Recurring error-trend analysis',
      'Retesting after client corrections'
    )
    Outputs = @(
      'Business-user test record',
      'Issue and defect queue',
      'Clause and field correction file',
      'Summary validation record',
      'Error-trend report',
      'Retesting result'
    )
    Client = @(
      'Product requirements and validation criteria',
      'Source documents and expected outputs',
      'Product logic, prompt and extraction changes',
      'Source-code, security and release decisions'
    )
    Boundary = 'This is business-user testing and human validation, not complete software QA. Axentra does not train or retrain AI models, change source code, perform penetration or cybersecurity testing, or own product-release decisions.'
    Related = @('process-sop-quality', 'contract-commercial-operations')
  },
  [pscustomobject]@{
    Number = '12'
    Slug = 'process-sop-quality'
    Name = 'Process, SOP and Quality Services'
    Family = 'Technology, process and quality'
    Short = 'Workflow assessment, SOPs, checklists, quality criteria, calibration, sampling, findings and improvement options.'
    Fit = 'For teams that need a recurring workflow documented, transitioned or reviewed before a delivery structure is established or changed.'
    Activities = @(
      'Workflow and user-needs assessment',
      'Responsibility and handoff mapping',
      'SOP and work-instruction preparation',
      'Template and checklist design',
      'Quality criteria and sampling design',
      'Calibration and sample validation',
      'Finding, rework and root-cause records',
      'Training and improvement recommendations'
    )
    Outputs = @(
      'Workflow map',
      'Responsibility matrix',
      'SOP and work instructions',
      'Review checklist',
      'Quality and sampling plan',
      'Improvement-options report'
    )
    Client = @(
      'Process ownership and approval',
      'Risk priorities and quality thresholds',
      'System, policy and instruction changes',
      'Implementation timing and change control'
    )
    Boundary = 'Design-thinking methods are used where useful for the engagement. Process, product, system and instruction changes are introduced only after client review and approval.'
    Related = @('legal-technology-ai-workflows', 'compliance-governance-privacy')
  }
)

$ServiceBySlug = @{}
foreach ($service in $Services) {
  $ServiceBySlug[$service.Slug] = $service
}

function Get-Prefix {
  param([int]$Depth)
  if ($Depth -eq 0) { return '' }
  return '../'
}

function Get-ActiveClass {
  param([string]$Active, [string]$Name)
  if ($Active -eq $Name) { return ' active' }
  return ''
}

function Get-ServiceMenuLinks {
  param([int]$Depth)
  $prefix = Get-Prefix $Depth
  return ($Services | ForEach-Object {
    '<a href="{0}services/{1}.html"><strong>{2}</strong></a>' -f $prefix, $_.Slug, $_.Name
  }) -join "`n"
}

function Get-Header {
  param(
    [string]$Active = '',
    [int]$Depth = 0
  )

  $prefix = Get-Prefix $Depth
  $homeClass = Get-ActiveClass $Active 'home'
  $servicesClass = Get-ActiveClass $Active 'services'
  $workClass = Get-ActiveClass $Active 'work'
  $securityClass = Get-ActiveClass $Active 'security'
  $aboutClass = Get-ActiveClass $Active 'about'
  $insightsClass = Get-ActiveClass $Active 'insights'
  $contactClass = Get-ActiveClass $Active 'contact'

  return @"
<header class="site-header">
  <div class="container nav-shell">
    <a class="brand" href="${prefix}index.html" aria-label="Axentra Solutions prototype home">
      <img src="${prefix}assets/images/axentra-solutions-logo.jpeg" alt="Axentra Solutions" width="1600" height="600" />
    </a>
    <button class="nav-toggle" type="button" aria-expanded="false" aria-controls="prototype-primary-nav" aria-label="Open navigation">
      <span></span><span></span><span></span>
    </button>
    <nav class="primary-nav" id="prototype-primary-nav" aria-label="Prototype navigation">
      <a class="$($homeClass.Trim())" href="${prefix}index.html">Home</a>
      <div class="services-nav">
        <button class="services-trigger$servicesClass" type="button" aria-expanded="false" aria-controls="prototype-services-panel">
          Managed Services <span class="chevron" aria-hidden="true"></span>
        </button>
        <div class="services-panel" id="prototype-services-panel">
          <div class="services-intro">
            <span class="eyebrow">Twelve service areas</span>
            <strong>Defined work. Clear ownership.</strong>
            <p>Explore the prototype service catalogue and the boundaries that keep client decisions clear.</p>
            <a href="${prefix}managed-services.html">View all managed services</a>
          </div>
          <div class="services-links">
            $(Get-ServiceMenuLinks -Depth $Depth)
          </div>
        </div>
      </div>
      <a class="$($workClass.Trim())" href="${prefix}how-we-work.html">How We Work</a>
      <a class="$($securityClass.Trim())" href="${prefix}security-trust.html">Security &amp; Trust</a>
      <a class="$($aboutClass.Trim())" href="${prefix}about.html">About</a>
      <a class="$($insightsClass.Trim())" href="${prefix}insights-faqs.html">Insights &amp; FAQs</a>
      <a class="nav-contact $($contactClass.Trim())" href="${prefix}contact.html">Contact</a>
    </nav>
  </div>
</header>
"@
}

function Get-Footer {
  param([int]$Depth = 0)
  $prefix = Get-Prefix $Depth

  return @"
<footer class="site-footer">
  <div class="container footer-grid">
    <div class="footer-brand">
      <a href="${prefix}index.html" aria-label="Axentra Solutions prototype home">
        <img src="${prefix}assets/images/axentra-solutions-logo.jpeg" alt="Axentra Solutions" width="1600" height="600" loading="lazy" />
      </a>
      <p class="footer-company">Axentra Solutions Pvt. Ltd.</p>
      <p>Alternative legal and business process services for clients in India and international markets.</p>
    </div>
    <div class="footer-column">
      <h2>Navigate</h2>
      <a href="${prefix}managed-services.html">Managed Services</a>
      <a href="${prefix}how-we-work.html">How We Work</a>
      <a href="${prefix}about.html">About</a>
      <a href="${prefix}contact.html">Contact</a>
    </div>
    <div class="footer-column">
      <h2>Review</h2>
      <a href="${prefix}security-trust.html">Security &amp; Trust</a>
      <a href="${prefix}insights-faqs.html">Insights &amp; FAQs</a>
      <a href="${prefix}managed-services.html#engagements">Engagement Options</a>
    </div>
    <div class="footer-column">
      <h2>Contact</h2>
      <a href="mailto:$GeneralEmail">$GeneralEmail</a>
      <a href="$LinkedInUrl" target="_blank" rel="noopener noreferrer">Axentra on LinkedIn</a>
      <a href="${prefix}contact.html">Discuss a Requirement</a>
    </div>
  </div>
  <div class="footer-base">
    <div class="container footer-base-grid">
      <p>&copy; <span data-current-year>2026</span> Axentra Solutions Pvt. Ltd.</p>
      <p class="prototype-label">Prototype V2 &mdash; for internal review</p>
    </div>
  </div>
</footer>
"@
}

function Get-Page {
  param(
    [Parameter(Mandatory)][string]$PageTitle,
    [Parameter(Mandatory)][string]$Description,
    [Parameter(Mandatory)][string]$Main,
    [string]$Active = '',
    [int]$Depth = 0,
    [string]$BodyClass = ''
  )

  $prefix = Get-Prefix $Depth
  return @"
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="robots" content="noindex, nofollow" />
    <meta name="description" content="$Description" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="Axentra Website Prototype V2 | $PageTitle" />
    <meta property="og:description" content="$Description" />
    <meta property="og:image" content="$PrototypeUrl/assets/images/social-preview.png" />
    <meta name="twitter:card" content="summary_large_image" />
    <title>Axentra Website Prototype V2 | $PageTitle</title>
    <link rel="stylesheet" href="${prefix}assets/css/prototype.css" />
    <script src="${prefix}assets/js/prototype.js" defer></script>
  </head>
  <body class="$BodyClass">
    <a class="skip-link" href="#main-content">Skip to content</a>
    $(Get-Header -Active $Active -Depth $Depth)
    <main id="main-content">
      $Main
    </main>
    $(Get-Footer -Depth $Depth)
  </body>
</html>
"@
}

function Get-ContactBand {
  param(
    [int]$Depth = 0,
    [string]$Heading = 'Discuss the work you need to deliver',
    [string]$Copy = 'Share the scope, expected volumes, systems, working hours, duration and review responsibilities.'
  )
  $prefix = Get-Prefix $Depth

  return @"
<section class="contact-band">
  <div class="container contact-band-grid">
    <div>
      <h2>$Heading</h2>
      <p>$Copy</p>
    </div>
    <a class="button button-light" href="${prefix}contact.html">Discuss Your Requirement</a>
  </div>
</section>
"@
}

function Get-ServiceFamilies {
  param([int]$Depth = 0)
  $prefix = Get-Prefix $Depth
  $families = @(
    [pscustomobject]@{ Number = '01'; Name = 'Legal and matter operations' },
    [pscustomobject]@{ Number = '02'; Name = 'Regulated and business operations' },
    [pscustomobject]@{ Number = '03'; Name = 'Technology, process and quality' }
  )

  $markup = foreach ($family in $families) {
    $links = ($Services | Where-Object Family -eq $family.Name | ForEach-Object {
      '<a href="{0}services/{1}.html"><strong>{2}</strong><span aria-hidden="true">&rarr;</span></a>' -f $prefix, $_.Slug, $_.Name
    }) -join "`n"

    @"
<div class="service-family">
  <div class="service-family-label"><span>$($family.Number)</span><h3>$($family.Name)</h3></div>
  <div class="service-list">$links</div>
</div>
"@
  }

  return '<div class="service-families">{0}</div>' -f ($markup -join "`n")
}

function Get-ListMarkup {
  param(
    [Parameter(Mandatory)][object[]]$Items,
    [string]$ClassName = 'bullet-grid'
  )
  return '<ul class="{0}">{1}</ul>' -f $ClassName, (($Items | ForEach-Object { "<li>$_</li>" }) -join "`n")
}

function Get-ServiceOptions {
  return ($Services | ForEach-Object {
    '<option value="{0}">{1}</option>' -f $_.Slug, $_.Name
  }) -join "`n"
}

function Get-ServicePage {
  param([Parameter(Mandatory)]$Service)
  $relatedLinks = ($Service.Related | ForEach-Object {
    $related = $ServiceBySlug[$_]
    '<a href="{0}.html">{1}</a>' -f $related.Slug, $related.Name
  }) -join "`n"

  $main = @"
<section class="page-hero service-hero">
  <div class="container narrow">
    <p class="eyebrow">Managed Service $($Service.Number)</p>
    <h1>$($Service.Name)</h1>
    <p class="lead">$($Service.Short)</p>
    <div class="button-row">
      <a class="button button-primary" href="../contact.html?service=$($Service.Slug)">Discuss This Service</a>
      <a class="button button-secondary" href="../managed-services.html">View All Services</a>
    </div>
  </div>
</section>
<section class="section">
  <div class="container">
    <div class="section-heading split-heading">
      <div><p class="eyebrow">Where this service fits</p><h2>A defined part of the client workflow</h2></div>
      <p>$($Service.Fit)</p>
    </div>
    <div class="scope-grid">
      <article class="scope-panel">
        <h3>Activities</h3>
        $(Get-ListMarkup -Items $Service.Activities -ClassName 'plain-list')
      </article>
      <article class="scope-panel">
        <h3>Typical delivery records</h3>
        $(Get-ListMarkup -Items $Service.Outputs -ClassName 'plain-list')
      </article>
    </div>
  </div>
</section>
<section class="section section-muted">
  <div class="container detail-grid">
    <div>
      <p class="eyebrow">Delivery setup</p>
      <h2>Arranged around the work</h2>
      <p>The team, review layers, working hours, reporting and escalation routes are agreed for the engagement.</p>
    </div>
    <div>
      $(Get-ListMarkup -Items @('Scope and expected volumes','Client systems and approved environments','Required skills and seniority','Instructions, templates and source material','Quality criteria and review layers','Working hours and time-zone overlap','Status reporting and escalation','Transition, calibration and change control'))
    </div>
  </div>
</section>
<section class="section">
  <div class="container detail-grid">
    <div>
      <p class="eyebrow">Client decisions</p>
      <h2>Responsibilities stay visible</h2>
      <p>Each engagement identifies the decisions, authority and approvals that remain with the client or another authorised professional.</p>
    </div>
    <div>
      $(Get-ListMarkup -Items $Service.Client)
      <p class="boundary-note">$($Service.Boundary)</p>
    </div>
  </div>
</section>
<section class="section section-ink">
  <div class="container">
    <div class="section-heading"><p class="eyebrow">Related services</p><h2>Connected workflows</h2></div>
    <div class="related-links">$relatedLinks</div>
  </div>
</section>
$(Get-ContactBand -Depth 1 -Heading "Discuss $($Service.Name)" -Copy 'Share the work, volumes, systems, deadlines, working hours and review responsibilities.')
"@

  return Get-Page -PageTitle $Service.Name -Description $Service.Short -Main $main -Active 'services' -Depth 1 -BodyClass 'service-page'
}

$homeMain = @"
<section class="home-hero">
  <img class="home-hero-image" src="assets/images/operations-hero.png" alt="A specialist legal and business operations team reviewing documents and workflow records" width="1674" height="941" fetchpriority="high" />
  <div class="home-hero-scrim" aria-hidden="true"></div>
  <div class="container home-hero-content">
    <p class="eyebrow">Axentra Solutions Pvt. Ltd.</p>
    <h1>Managed legal and business operations</h1>
    <p class="lead">A specialist delivery team for defined workflows, recurring operations and project-based requirements.</p>
    <p class="home-hero-copy">Axentra works with law firms, in-house functions, lenders, servicers and legal, contract and property technology companies in India and international markets.</p>
    <div class="button-row">
      <a class="button button-primary" href="managed-services.html">Explore Managed Services</a>
      <a class="button button-secondary" href="contact.html">Discuss Your Requirement</a>
    </div>
  </div>
</section>
<section class="fact-rail" aria-label="Engagement options">
  <div class="container">
    <ul class="fact-rail-list"><li>Defined projects</li><li>Managed workflows</li><li>Dedicated teams</li><li>Secondments</li></ul>
  </div>
</section>
<section class="section">
  <div class="container">
    <div class="section-heading split-heading">
      <div><p class="eyebrow">Extended delivery team</p><h2>One team, clear ownership</h2></div>
      <div><p>Axentra takes responsibility for an agreed part of the client process, with defined outputs, review points, reporting and escalation.</p><p>The delivery team works within client or approved systems and remains aligned with client instructions, working hours and quality requirements.</p></div>
    </div>
    <div class="principle-grid">
      <article><h3>Defined responsibility</h3><p>Scope, outputs, deadlines, dependencies and decisions are agreed before delivery begins.</p></article>
      <article><h3>Integrated delivery</h3><p>Teams work through the systems, templates, instructions and communication channels set for the engagement.</p></article>
      <article><h3>Visible quality</h3><p>Review layers, exceptions, rework and recurring findings are recorded and reported.</p></article>
      <article><h3>Flexible structure</h3><p>Team size, seniority, working hours and coverage reflect the work rather than a fixed staffing pattern.</p></article>
    </div>
  </div>
</section>
<section class="section section-muted">
  <div class="container">
    <div class="section-heading split-heading">
      <div><p class="eyebrow">Managed services</p><h2>Twelve service areas around client workflows</h2></div>
      <p>Each prototype service page describes the work, common delivery records, client decisions and scope boundaries.</p>
    </div>
    $(Get-ServiceFamilies -Depth 0)
    <div class="button-row"><a class="button button-secondary" href="managed-services.html">View Managed Services</a></div>
  </div>
</section>
<section class="section section-ink">
  <div class="container">
    <div class="section-heading split-heading">
      <div><p class="eyebrow">Quality throughout delivery</p><h2>Prepared, reviewed, escalated and improved</h2></div>
      <p>Quality arrangements are agreed for the project or managed workflow. Review findings are used to make recurring issues and improvement options visible.</p>
    </div>
    <div class="quality-grid">
      <article><h3>Clear criteria</h3><p>Instructions, templates, checklists and expected outputs are calibrated at setup.</p></article>
      <article><h3>Review layers</h3><p>Production checks, supervisory review, sampling or independent QA follow the engagement requirements.</p></article>
      <article><h3>Exceptions tracked</h3><p>Missing information, deviations and unusual cases enter an agreed escalation route.</p></article>
      <article><h3>Findings shared</h3><p>Recurring errors and rework patterns inform client decisions about training, instructions, workflows or product logic.</p></article>
    </div>
  </div>
</section>
<section class="section">
  <div class="container detail-grid">
    <div><p class="eyebrow">Technology and judgement</p><h2>Technology assists. People remain accountable.</h2><p>Axentra works in client and approved platforms and uses automation or AI where the engagement permits it.</p></div>
    <div>
      $(Get-ListMarkup -Items @('Document classification and data extraction','Clause and document comparison','Workflow routing and status tracking','Draft preparation from approved templates','Validation and quality sampling','Reporting and exception identification'))
      <p class="boundary-note">Trained professionals review work against source documents, client instructions and agreed quality criteria. Client information is not entered into unauthorised public AI tools or used for independent model training.</p>
    </div>
  </div>
</section>
$(Get-ContactBand)
"@

$managedMain = @"
<section class="page-hero">
  <div class="container narrow">
    <p class="eyebrow">Managed Services</p>
    <h1>Services organised around the work clients need to run</h1>
    <p class="lead">Defined projects, recurring workflows, dedicated teams and secondments across legal and business operations.</p>
    <p>The final scope, systems, roles, review layers, working hours and reporting are agreed for each engagement.</p>
  </div>
</section>
<section class="section">
  <div class="container">
    <div class="section-heading split-heading">
      <div><p class="eyebrow">Service catalogue</p><h2>Twelve connected service areas</h2></div>
      <p>Workflow Assessment remains part of process, SOP and quality work rather than a separate equal service line.</p>
    </div>
    $(Get-ServiceFamilies -Depth 0)
  </div>
</section>
<section class="section section-muted" id="engagements">
  <div class="container">
    <div class="section-heading split-heading">
      <div><p class="eyebrow">Engagement options</p><h2>Ways to work with Axentra</h2></div>
      <p>Working hours, time-zone overlap, planned leave, holiday coverage and deadline requirements are agreed through the staffing and delivery plan.</p>
    </div>
    <div class="engagement-grid">
      <article><h3>On-demand requirements</h3><p>Specialist capacity for deadlines, backlogs, workload peaks, leave coverage or temporary resource gaps.</p></article>
      <article><h3>Defined projects</h3><p>A team and delivery plan arranged around a specific scope, output, timeline and completion criteria.</p></article>
      <article><h3>Managed workflows</h3><p>Recurring delivery with agreed instructions, quality checks, reporting and escalation routes.</p></article>
      <article><h3>Dedicated teams</h3><p>Teams arranged around volumes, roles, systems, working hours and review requirements.</p></article>
      <article><h3>Secondments</h3><p>Professionals assigned for an agreed period within the client team, systems and reporting lines.</p></article>
    </div>
  </div>
</section>
<section class="statement-band">
  <div class="container statement-grid">
    <h2>Before delivery begins</h2>
    <p>Axentra reviews scope, volumes, required skills, client systems, production roles, review layers, reporting, escalation, working hours, time zones and duration before proposing the delivery structure.</p>
  </div>
</section>
$(Get-ContactBand)
"@

$howMain = @"
<section class="page-hero">
  <div class="container narrow">
    <p class="eyebrow">How We Work</p>
    <h1>Understand the work before establishing delivery</h1>
    <p class="lead">Axentra uses design-thinking methods where they help the teams understand users, dependencies and process friction before changes are proposed.</p>
    <p>Client feedback continues after work begins. Instructions, training, quality checks and workflows remain open to agreed adjustment throughout the engagement.</p>
  </div>
</section>
<section class="section section-muted">
  <div class="container">
    <div class="section-heading split-heading">
      <div><p class="eyebrow">Company-wide process</p><h2>Five stages from discovery to improvement</h2></div>
      <p>The process applies across projects, recurring workflows, dedicated teams and secondments.</p>
    </div>
    <div class="process-grid">
      <article><span class="process-number">01</span><h3>Understand</h3><p>Review the work, volumes, systems, working hours, experience, deadlines and expected outputs.</p></article>
      <article><span class="process-number">02</span><h3>Design</h3><p>Agree responsibilities, team roles, instructions, access, review layers, reporting and escalation.</p></article>
      <article><span class="process-number">03</span><h3>Transition</h3><p>Complete knowledge transfer, training, access, sample work, calibration and initial quality review.</p></article>
      <article><span class="process-number">04</span><h3>Deliver</h3><p>Perform and review the work, track open items, manage exceptions and report against requirements.</p></article>
      <article><span class="process-number">05</span><h3>Improve</h3><p>Review quality findings, feedback and delivery trends, then share relevant improvement options.</p></article>
    </div>
  </div>
</section>
<section class="section">
  <div class="container detail-grid">
    <div><p class="eyebrow">Team design</p><h2>Structured for the engagement</h2><p>Axentra does not apply one fixed team structure to every client or project.</p></div>
    <div>$(Get-ListMarkup -Items @('Scope and complexity','Expected volumes and variability','Required skills and seniority','Client systems and access','Production and review roles','Quality-review requirements','Working hours and time-zone overlap','Reporting and escalation requirements','Project duration','Planned holiday and leave coverage'))</div>
  </div>
</section>
<section class="section section-ink">
  <div class="container detail-grid">
    <div><p class="eyebrow">Quality management</p><h2>Review arrangements follow the work</h2><p>Not every engagement includes every quality layer. The review structure is agreed according to the work and client requirements.</p></div>
    <div>$(Get-ListMarkup -Items @('Initial sample validation','Calibration exercises','First-line checks','Supervisory review','Independent QA where agreed','Risk-based sampling','Exception and rework registers','Root-cause and corrective-action records','Client feedback and refresher training'))</div>
  </div>
</section>
<section class="section">
  <div class="container detail-grid">
    <div><p class="eyebrow">Continuous client input</p><h2>Client alignment continues throughout delivery</h2><p>Delivery is not treated as fixed once the project begins.</p></div>
    <div><p>Axentra keeps agreed feedback routes open through regular reporting, quality discussions, escalation and change control. Changes to client instructions, systems, products or processes are introduced only after client review and agreement.</p><p>The aim is to keep the delivery aligned with the requirement and make useful findings visible without promising a particular cost, accuracy or turnaround outcome.</p></div>
  </div>
</section>
$(Get-ContactBand)
"@

$securityMain = @"
<section class="page-hero">
  <div class="container narrow">
    <p class="eyebrow">Security &amp; Trust</p>
    <h1>How Axentra protects client information</h1>
    <p class="lead">Information security is addressed through employment and vendor obligations, internal policies, workforce training, approved IT assets, access controls and engagement requirements.</p>
    <p>Quality and security responsibilities are considered together during delivery setup. Team members receive access only to information and systems required for assigned roles.</p>
  </div>
</section>
<section class="section section-muted">
  <div class="container">
    <div class="section-heading"><p class="eyebrow">Core safeguards</p><h2>Responsibilities carried through people, systems and providers</h2></div>
    <div class="principle-grid">
      <article><h3>People obligations</h3><p>Confidentiality, data protection, intellectual property, information security and AI-use requirements.</p></article>
      <article><h3>Vendor flow-down</h3><p>Relevant confidentiality, access, incident, return, deletion and subcontracting restrictions.</p></article>
      <article><h3>Approved access</h3><p>Devices, user roles, software, storage and remote-working arrangements set for the engagement.</p></article>
      <article><h3>Training and instructions</h3><p>Policy acknowledgement, workforce training and engagement-specific data-handling requirements.</p></article>
    </div>
  </div>
</section>
<section class="section">
  <div class="container detail-grid">
    <div><p class="eyebrow">Information handling</p><h2>Access follows the assigned role</h2><p>The safeguards used depend on the information, client systems, contract terms and work being performed.</p></div>
    <div>$(Get-ListMarkup -Items @('Confidential and commercially sensitive information','Personal and sensitive personal data','Protected health information where agreed','Privileged and restricted records','Minimum necessary access','Client and approved tools only','Retention, return and deletion requirements','Access changes and offboarding'))</div>
  </div>
</section>
<section class="section section-ink">
  <div class="container detail-grid">
    <div><p class="eyebrow">Responsible AI use</p><h2>Client instructions determine permitted use</h2><p>Technology use is limited by engagement terms, approved tools and access arrangements.</p></div>
    <div>$(Get-ListMarkup -Items @('Client instructions and contract restrictions','Permitted tools and environments','Minimum necessary information','Professional review of outputs','Vendor obligations and escalation','No independent model training with client information'))<p class="boundary-note">Client information is not entered into unauthorised public AI tools or used for independent model training.</p></div>
  </div>
</section>
<section class="section">
  <div class="container detail-grid">
    <div><p class="eyebrow">Response and closure</p><h2>Plan for incidents, interruptions and endings</h2></div>
    <div>$(Get-ListMarkup -Items @('Internal incident reporting and escalation','Containment, access changes and record preservation','Client notification according to engagement terms','Staffing, communication and recovery planning','Open-work handover and access removal','Information return, deletion and retention actions','Asset return and continuing obligations','Completion records for offboarding and closure'))</div>
  </div>
</section>
<section class="statement-band">
  <div class="container statement-grid">
    <h2>Transparent certification position</h2>
    <p>Axentra does not claim an information-security or privacy certification it has not obtained. PHI and HIPAA-related roles, safeguards and any Business Associate Agreement are addressed before processing begins.</p>
  </div>
</section>
$(Get-ContactBand -Heading 'Discuss security and data-handling requirements' -Copy 'Review the information, access environment, contract terms and available documentation before delivery begins.')
"@

$aboutMain = @"
<section class="page-hero">
  <div class="container narrow">
    <p class="eyebrow">About Axentra</p>
    <h1>An alternative legal and business process services company</h1>
    <p class="lead">Axentra works as an extended specialist team for clients in India and international markets.</p>
    <p>Law firms, in-house functions, lenders, servicers and legal, contract and property technology companies engage Axentra for projects, recurring workflows, dedicated teams and professional secondments.</p>
  </div>
</section>
<section class="section section-muted">
  <div class="container">
    <div class="principle-grid">
      <article><p class="eyebrow">Vision</p><h3>A specialist team clients can rely on</h3><p>To become the extended specialist team clients rely on for consistent, secure and accountable delivery.</p></article>
      <article><p class="eyebrow">Mission</p><h3>Flexible teams and managed workflows</h3><p>To combine domain knowledge, responsible technology use, professional judgement and measurable quality.</p></article>
      <article><p class="eyebrow">Delivery</p><h3>Responsibility for agreed work</h3><p>Roles, outputs, review points, dependencies and escalation remain clear throughout delivery.</p></article>
      <article><p class="eyebrow">Improvement</p><h3>Share what the work reveals</h3><p>Recurring issues, rework and useful improvement options are made visible to the client.</p></article>
    </div>
  </div>
</section>
<section class="section">
  <div class="container detail-grid">
    <div><p class="eyebrow">Working principles</p><h2>How Axentra approaches client work</h2></div>
    <div>$(Get-ListMarkup -Items @('Understand the requirement before proposing the team','Work within agreed systems and instructions','Take responsibility for the agreed delivery','Build quality criteria and review into the workflow','Use technology where it improves delivery','Keep trained professionals accountable for outputs','Protect client information','Maintain client alignment throughout delivery','Share relevant findings and improvement options'))</div>
  </div>
</section>
<section class="section section-ink" id="leadership">
  <div class="container">
    <div class="section-heading"><p class="eyebrow">Leadership</p><h2>Company direction and client engagement</h2></div>
    <div class="leadership-grid">
      <article><p class="role">Founder</p><h3>Gagan Prajapati</h3><p>Gagan works on company direction, partnerships and governance, while delivery is managed through Axentra service and operations teams.</p><a class="text-link" href="https://www.linkedin.com/in/gagan-prajapati-6b3439a5/" target="_blank" rel="noopener noreferrer">View LinkedIn profile</a></article>
      <article><p class="role">Co-founder</p><h3>Pooja Gore</h3><p>Pooja contributes to business development, client engagement and services arranged around client workflows, systems and operating requirements.</p><a class="text-link" href="https://www.linkedin.com/in/pooja-gore-99712723b/" target="_blank" rel="noopener noreferrer">View LinkedIn profile</a></article>
    </div>
  </div>
</section>
$(Get-ContactBand)
"@

$faqs = @(
  [pscustomobject]@{ Id = 'what-services'; Group = 'Services'; Q = 'What services does Axentra provide?'; A = 'The prototype presents twelve service areas across legal and matter operations, regulated and business operations, and technology, process and quality work. Final public positioning and the broader catalogue require approval before any root-site replacement.' },
  [pscustomobject]@{ Id = 'who-clients'; Group = 'Services'; Q = 'Who does Axentra work with?'; A = 'Axentra works with law firms, in-house legal and business functions, lenders, servicers, technology companies and other organisations managing defined legal and business workflows.' },
  [pscustomobject]@{ Id = 'legal-advice'; Group = 'Boundaries'; Q = 'Does Axentra provide legal advice or representation?'; A = 'No. Axentra is not a law firm and does not provide legal representation. Legal decisions remain with the client and authorised professionals.' },
  [pscustomobject]@{ Id = 'engagement-options'; Group = 'Engagements'; Q = 'What engagement options are available?'; A = 'Requirements can be arranged as on-demand capacity, a defined project, a managed recurring workflow, a dedicated team or a secondment.' },
  [pscustomobject]@{ Id = 'engagement-start'; Group = 'Engagements'; Q = 'How does an engagement begin?'; A = 'Axentra reviews the work, volumes, systems, working hours, skills, deadlines, expected outputs, review responsibilities, reporting and escalation before proposing the team and transition plan.' },
  [pscustomobject]@{ Id = 'timezone'; Group = 'Engagements'; Q = 'Can teams align with client working hours?'; A = 'Working hours and time-zone overlap are agreed through the staffing plan. Planned holiday, leave and deadline coverage is arranged for the engagement without claiming universal or round-the-clock coverage.' },
  [pscustomobject]@{ Id = 'quality'; Group = 'Delivery'; Q = 'How is quality arranged?'; A = 'The project or managed workflow defines criteria, calibration, production checks, supervisory review, sampling, exception management, reporting and improvement actions. Not every engagement includes every review layer.' },
  [pscustomobject]@{ Id = 'changes'; Group = 'Delivery'; Q = 'What happens when instructions change?'; A = 'The change is recorded, affected work is identified, instructions and review criteria are updated, and implementation follows client review and agreement.' },
  [pscustomobject]@{ Id = 'technology'; Group = 'Technology'; Q = 'How does Axentra use technology and AI?'; A = 'Axentra uses client and approved tools where they improve delivery, consistency or visibility. Trained professionals remain accountable for review, judgement, exceptions and quality.' },
  [pscustomobject]@{ Id = 'ai-data'; Group = 'Technology'; Q = 'Is client information used to train AI models?'; A = 'Client information is not entered into unauthorised public AI tools or used by Axentra for independent model training.' },
  [pscustomobject]@{ Id = 'certifications'; Group = 'Security'; Q = 'Which security certifications does Axentra claim?'; A = 'The prototype does not claim a certification that Axentra has not obtained. Available policies, practices and documentation can be discussed during client diligence.' },
  [pscustomobject]@{ Id = 'first-discussion'; Group = 'Contact'; Q = 'What information is useful for a first discussion?'; A = 'Share the work type, approximate volumes, duration, systems, source information, expected output, review responsibilities, working hours and deadlines. Do not send confidential client files through the public form.' }
)

$faqMarkup = ($faqs | ForEach-Object {
  @"
<details id="$($_.Id)">
  <summary>$($_.Q)</summary>
  <div class="faq-answer"><p>$($_.A)</p></div>
</details>
"@
}) -join "`n"

$insightsMain = @"
<section class="page-hero">
  <div class="container narrow">
    <p class="eyebrow">Insights &amp; FAQs</p>
    <h1>Practical questions behind managed legal and business operations</h1>
    <p class="lead">Topics and answers about service scope, delivery structure, quality, technology, security and client responsibilities.</p>
  </div>
</section>
<section class="section section-muted">
  <div class="container">
    <div class="section-heading split-heading">
      <div><p class="eyebrow">Insight themes</p><h2>What the work makes visible</h2></div>
      <p>Prototype themes are shown for review. Published articles and claims will continue to be linked from approved Axentra sources.</p>
    </div>
    <div class="topic-grid">
      <article><h3>Workflow design</h3><p>Scope, responsibilities, handoffs, systems and escalation before transition.</p></article>
      <article><h3>Quality management</h3><p>Calibration, review layers, exception records, root causes and corrective action.</p></article>
      <article><h3>Contract data</h3><p>Terms, commercial conditions, dependencies, owners and post-signature use.</p></article>
      <article><h3>Bankruptcy operations</h3><p>Pre-filing preparation, filing readiness, post-filing events and claim records.</p></article>
      <article><h3>Technology validation</h3><p>Business-user testing and human validation of AI-generated workflow outputs.</p></article>
      <article><h3>Information handling</h3><p>People, vendor, access, training, incident, continuity and closure responsibilities.</p></article>
    </div>
    <div class="button-row"><a class="button button-secondary" href="$LinkedInUrl" target="_blank" rel="noopener noreferrer">View Axentra on LinkedIn</a></div>
  </div>
</section>
<section class="section">
  <div class="container narrow">
    <div class="section-heading"><p class="eyebrow">Frequently asked questions</p><h2>Answers for an initial review</h2></div>
    <nav class="faq-nav" aria-label="FAQ shortcuts">
      <a href="#what-services">Services</a><a href="#engagement-options">Engagements</a><a href="#quality">Delivery</a><a href="#technology">Technology</a><a href="#certifications">Security</a><a href="#first-discussion">Contact</a>
    </nav>
    <div class="faq-list">$faqMarkup</div>
  </div>
</section>
$(Get-ContactBand)
"@

$contactMain = @"
<section class="page-hero">
  <div class="container narrow">
    <p class="eyebrow">Contact Axentra</p>
    <h1>Discuss your requirement</h1>
    <p class="lead">Share the work, volumes, systems, working hours, duration and type of engagement you are considering.</p>
  </div>
</section>
<section class="section">
  <div class="container contact-layout">
    <div class="contact-intro">
      <p class="eyebrow">First discussion</p>
      <h2>Enough detail for a useful response</h2>
      <p>The form prepares an email in your email application. The prototype does not transmit or store the entries.</p>
      <div class="contact-direct">
        <a href="mailto:$GeneralEmail">$GeneralEmail</a>
        <a href="tel:+919725024355">+91 97250 24355</a>
        <a href="$LinkedInUrl" target="_blank" rel="noopener noreferrer">Axentra on LinkedIn</a>
      </div>
    </div>
    <form class="contact-form" id="prototype-contact-form" novalidate>
      <div class="form-field"><label for="prototype-name">Name</label><input id="prototype-name" name="name" autocomplete="name" required /></div>
      <div class="form-field"><label for="prototype-organisation">Organisation</label><input id="prototype-organisation" name="organisation" autocomplete="organization" required /></div>
      <div class="form-field"><label for="prototype-email">Work email</label><input id="prototype-email" name="email" type="email" autocomplete="email" required /></div>
      <div class="form-field"><label for="prototype-market">Country or market</label><input id="prototype-market" name="market" autocomplete="country-name" required /></div>
      <div class="form-field"><label for="prototype-service">Service</label><select id="prototype-service" name="service" required><option value="">Select a service</option>$(Get-ServiceOptions)<option value="other">Other or not yet decided</option></select></div>
      <div class="form-field"><label for="prototype-engagement">Engagement type</label><select id="prototype-engagement" name="engagement" required><option value="">Select an option</option><option>On-demand requirement</option><option>Defined project</option><option>Managed workflow</option><option>Dedicated team</option><option>Secondment</option><option>Not yet decided</option></select></div>
      <div class="form-field"><label for="prototype-volume">Approximate volume or team requirement</label><input id="prototype-volume" name="volume" /></div>
      <div class="form-field"><label for="prototype-hours">Preferred working hours or time-zone overlap</label><input id="prototype-hours" name="hours" /></div>
      <div class="form-field"><label for="prototype-duration">Expected duration</label><input id="prototype-duration" name="duration" /></div>
      <div class="form-field full"><label for="prototype-requirement">Brief requirement</label><textarea id="prototype-requirement" name="requirement" required></textarea></div>
      <div class="form-field full"><p class="form-warning">Do not submit confidential information, personal data, protected health information, borrower records, case documents, loan documents or client files through this form.</p></div>
      <div class="form-actions"><button class="button button-primary" type="submit">Prepare Email</button><p class="form-status" id="prototype-form-status" role="status" aria-live="polite"></p></div>
    </form>
  </div>
</section>
"@

Write-PrototypeFile -Path 'index.html' -Content (Get-Page -PageTitle 'Home' -Description 'Prototype V2 for Axentra Solutions, presenting managed legal and business operations, engagement options, quality and responsible technology use.' -Main $homeMain -Active 'home' -BodyClass 'home-page')
Write-PrototypeFile -Path 'managed-services.html' -Content (Get-Page -PageTitle 'Managed Services' -Description 'Prototype managed-services catalogue across legal, business, regulated, technology, process and quality workflows.' -Main $managedMain -Active 'services' -BodyClass 'managed-services-page')
Write-PrototypeFile -Path 'how-we-work.html' -Content (Get-Page -PageTitle 'How We Work' -Description 'Prototype delivery approach covering discovery, design, transition, delivery, improvement, team structure and quality management.' -Main $howMain -Active 'work' -BodyClass 'how-page')
Write-PrototypeFile -Path 'security-trust.html' -Content (Get-Page -PageTitle 'Security and Trust' -Description 'Prototype security and trust page covering people and vendor obligations, approved access, AI use, incidents, continuity and closure.' -Main $securityMain -Active 'security' -BodyClass 'security-page')
Write-PrototypeFile -Path 'about.html' -Content (Get-Page -PageTitle 'About' -Description 'Prototype About page for Axentra Solutions, an alternative legal and business process services company serving India and international markets.' -Main $aboutMain -Active 'about' -BodyClass 'about-page')
Write-PrototypeFile -Path 'insights-faqs.html' -Content (Get-Page -PageTitle 'Insights and FAQs' -Description 'Prototype insights and answers about Axentra services, engagements, quality, technology, security and client responsibilities.' -Main $insightsMain -Active 'insights' -BodyClass 'insights-page')
Write-PrototypeFile -Path 'contact.html' -Content (Get-Page -PageTitle 'Contact' -Description 'Prototype contact page for discussing managed legal and business operations, projects, teams and secondments with Axentra.' -Main $contactMain -Active 'contact' -BodyClass 'contact-page')

foreach ($service in $Services) {
  Write-PrototypeFile -Path "services/$($service.Slug).html" -Content (Get-ServicePage -Service $service)
}

Write-Output "Generated $($Services.Count + 7) prototype pages inside $PrototypeRoot"
