$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$Root = Split-Path -Parent $PSScriptRoot
$BasePath = '/axentra-solutions-website'
$SiteUrl = 'https://legalworkflowlab.github.io/axentra-solutions-website'
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

function Get-Header {
  param([Parameter(Mandatory)][string]$Active)

  $homeCurrent = if ($Active -eq 'home') { ' class="active" aria-current="page"' } else { '' }
  $servicesClass = if ($Active -eq 'services') { ' active' } else { '' }
  $servicesCurrent = if ($Active -eq 'services') { ' aria-current="page"' } else { '' }
  $workCurrent = if ($Active -eq 'work') { ' class="active" aria-current="page"' } else { '' }
  $aboutCurrent = if ($Active -eq 'about') { ' class="active" aria-current="page"' } else { '' }
  $insightsCurrent = if ($Active -eq 'insights') { ' class="active" aria-current="page"' } else { '' }
  $contactCurrent = if ($Active -eq 'contact') { ' class="active" aria-current="page"' } else { '' }

  return @"
<header class="site-header">
  <div class="container nav-shell">
    <a class="brand" href="$BasePath/">
      <img src="$BasePath/assets/images/axentra-solutions-logo.jpeg" alt="Axentra Solutions" />
    </a>
    <button class="nav-toggle" type="button" aria-expanded="false" aria-controls="primary-nav" aria-label="Open navigation">
      <span></span><span></span><span></span>
    </button>
    <nav class="primary-nav" id="primary-nav" aria-label="Primary navigation">
      <a href="$BasePath/"$homeCurrent>Home</a>
      <div class="managed-menu">
        <button class="menu-toggle$servicesClass" type="button" aria-expanded="false" aria-controls="managed-services-menu"$servicesCurrent>
          Managed Services <span class="menu-chevron" aria-hidden="true"></span>
        </button>
        <div class="mega-menu" id="managed-services-menu">
          <div class="mega-menu-grid">
            <div>
              <p class="mega-menu-heading">Legal Managed Services</p>
              <a href="$BasePath/services/contract-commercial-operations.html">Contract Lifecycle and Commercial Operations</a>
              <a href="$BasePath/services/ediscovery-investigations-document-review.html">eDiscovery, Investigations and Document Review</a>
              <a href="$BasePath/services/bankruptcy-case-operations.html">Bankruptcy and Case Operations</a>
              <a href="$BasePath/services/compliance-governance-privacy.html">Compliance, Governance and Privacy</a>
              <a href="$BasePath/services/case-matter-records-management.html">Case, Matter and Records Management</a>
              <a href="$BasePath/services/deal-diligence-transaction-support.html">Deal, Diligence and Transaction Support</a>
            </div>
            <div>
              <p class="mega-menu-heading">Business Process Managed Services</p>
              <a href="$BasePath/services/finance-invoicing-legal-spend.html">Finance, Invoicing and Legal Spend Operations</a>
              <a href="$BasePath/services/kyc-kyb-aml-onboarding.html">KYC, KYB, AML and Onboarding</a>
              <a href="$BasePath/services/mortgage-lending-default-operations.html">Mortgage, Lending and Default Operations</a>
              <a href="$BasePath/services/property-lease-operations.html">Property and Lease Operations</a>
            </div>
            <div>
              <p class="mega-menu-heading">Workflow and Technology Enablement</p>
              <a href="$BasePath/services/legal-technology-ai-workflows.html">Legal Technology and AI Workflow Enablement</a>
              <a href="$BasePath/services/process-sop-quality-support.html">Process Design, SOP and Quality Support</a>
              <a class="mega-all" href="$BasePath/services/">View All Managed Services</a>
            </div>
          </div>
        </div>
      </div>
      <a href="$BasePath/how-we-work.html"$workCurrent>How We Work</a>
      <a href="$BasePath/about.html"$aboutCurrent>About Axentra</a>
      <a href="$BasePath/insights/"$insightsCurrent>Insights &amp; FAQs</a>
      <a href="$BasePath/contact.html"$contactCurrent>Contact</a>
    </nav>
  </div>
</header>
"@
}

function Get-Footer {
  return @"
<footer class="site-footer">
  <div class="container footer-main">
    <div class="footer-brand">
      <a href="$BasePath/">
        <img src="$BasePath/assets/images/axentra-solutions-logo.jpeg" alt="Axentra Solutions" />
      </a>
      <p>Legal and business operations managed services shaped around the client's workflows, systems and operating requirements.</p>
    </div>
    <div class="footer-column">
      <h2>Explore</h2>
      <a href="$BasePath/">Home</a>
      <a href="$BasePath/services/">Managed Services</a>
      <a href="$BasePath/how-we-work.html">How We Work</a>
      <a href="$BasePath/about.html">About Axentra</a>
      <a href="$BasePath/insights/">Insights &amp; FAQs</a>
      <a href="$BasePath/contact.html">Contact</a>
    </div>
    <div class="footer-column">
      <h2>Connect</h2>
      <a href="https://www.linkedin.com/company/axentra-solutions-pvt-ltd/" target="_blank" rel="noopener noreferrer">Axentra on LinkedIn</a>
      <a href="https://www.linkedin.com/in/gagan-prajapati-6b3439a5/" target="_blank" rel="noopener noreferrer">Gagan Prajapati</a>
      <a href="https://www.linkedin.com/in/pooja-gore-99712723b/" target="_blank" rel="noopener noreferrer">Pooja Gore</a>
      <a href="mailto:info@axentrabusiness.com">info@axentrabusiness.com</a>
      <a href="mailto:pooja.gore@axentrabusiness.com">pooja.gore@axentrabusiness.com</a>
      <a href="tel:+919725024355">+91 97250 24355</a>
    </div>
  </div>
  <div class="footer-boundary">
    <div class="container footer-boundary-inner">
      <p>Axentra provides managed operational services within the scope, instructions and review arrangements agreed with the client. Legal, regulatory, financial and commercial decisions remain with the client's authorised professionals.</p>
      <p>&copy; 2026 Axentra Solutions Pvt. Ltd.</p>
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
    [Parameter(Mandatory)][string]$Active,
    [Parameter(Mandatory)][string]$Main,
    [string]$BodyClass = '',
    [string]$AdditionalHead = ''
  )

  return @"
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="$Description" />
    <link rel="canonical" href="$Canonical" />
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
    <link rel="canonical" href="$Canonical" />
    <meta http-equiv="refresh" content="0; url=$Target" />
    <title>$Title</title>
    <link rel="stylesheet" href="$BasePath/styles.css" />
    <script>window.location.replace('$Target');</script>
  </head>
  <body>
    <main class="redirect-page">
      <div class="redirect-panel">
        <a class="redirect-logo" href="$BasePath/"><img src="$BasePath/assets/images/axentra-solutions-logo.jpeg" alt="Axentra Solutions" /></a>
        <h1>$Heading</h1>
        <p>$Copy</p>
        <a class="button primary" href="$Target">$LinkLabel</a>
      </div>
    </main>
  </body>
</html>
"@
}

$services = @(
  [pscustomobject]@{
    Group = 'legal'; Slug = 'contract-commercial-operations'; Name = 'Contract Lifecycle and Commercial Operations'
    Meta = 'Managed contract lifecycle and commercial operations for intake, approved-template drafting, review preparation, execution, repositories and post-signature tracking.'
    Intro = 'Axentra can manage defined contract workflows from intake through post-signature administration, using client templates, playbooks, systems and approval routes.'
    Fit = 'Legal, procurement and commercial teams with recurring contract volumes, multiple hand-offs or backlogs around execution and contract records.'
    Manage = @('Contract intake and request triage','Drafting from client-approved templates','First-level review preparation against playbooks','Negotiation trackers and open-point follow-up','Signature and execution coordination','Repository, metadata and renewal administration')
    Outputs = @('Review-ready contract packs','Clause and open-point trackers','Execution status reports','Repository updates','Renewal and obligation trackers')
    Dependencies = 'Client teams provide approved templates, playbooks, system access, approval routes and negotiation positions. Legal judgement, risk acceptance and final approval remain with the client.'
    Structure = 'An engagement may begin with one contract type or business unit, then extend into a managed workflow once instructions, review points and reporting are agreed.'
    Related = @('deal-diligence-transaction-support','legal-technology-ai-workflows','process-sop-quality-support')
  },
  [pscustomobject]@{
    Group = 'legal'; Slug = 'ediscovery-investigations-document-review'; Name = 'eDiscovery, Investigations and Document Review'
    Meta = 'Managed eDiscovery, investigation and document review workflows covering sources, review preparation, issue coding, quality checks and reporting.'
    Intro = 'Axentra manages document-intensive review workflows around client instructions, approved platforms, defined issue criteria, quality checks and reporting.'
    Fit = 'Investigations, disputes, regulatory responses and internal reviews where data sources, review batches and exceptions need visible coordination.'
    Manage = @('Custodian and source trackers','Legal hold records','Review set preparation','Issue coding under client instructions','Quality-control sampling records','Status and exception reporting')
    Outputs = @('Review batches','Issue and privilege trackers','Custodian status reports','Quality findings','Handover and exception summaries')
    Dependencies = 'Client teams provide platform access, review protocols, issue lists, privilege guidance and escalation routes. Legal decisions and final production approval remain with the client.'
    Structure = 'Scope may be organised by matter, data source, review stream, issue category or phase, with agreed review and escalation points.'
    Related = @('case-matter-records-management','compliance-governance-privacy','process-sop-quality-support')
  },
  [pscustomobject]@{
    Group = 'legal'; Slug = 'bankruptcy-case-operations'; Name = 'Bankruptcy and Case Operations'
    Meta = 'Managed bankruptcy and case operations for docket monitoring, claim files, case indexes, deadlines, exceptions and status reporting.'
    Intro = 'Axentra can manage repeatable bankruptcy and case operations around docket activity, claim materials, file organisation, deadlines and review-ready reporting.'
    Fit = 'Bankruptcy, restructuring, claims administration and case portfolios where volume creates pressure around records, deadlines and status visibility.'
    Manage = @('Docket monitoring records','Proof of claim files','Case document indexes','Deadline and exception trackers','Source record organisation','Case status reporting')
    Outputs = @('Docket update logs','Claim packs','Case chronology files','Missing-item trackers','Weekly status reports')
    Dependencies = 'Client teams provide case instructions, filing standards, source access and escalation rules. Legal strategy and filing decisions remain with authorised professionals.'
    Structure = 'Work may be scoped by case portfolio, claim type, docket source, case phase or reporting cycle.'
    Related = @('mortgage-lending-default-operations','case-matter-records-management','compliance-governance-privacy')
  },
  [pscustomobject]@{
    Group = 'legal'; Slug = 'compliance-governance-privacy'; Name = 'Compliance, Governance and Privacy'
    Meta = 'Managed compliance, governance and privacy operations for evidence, policies, third-party records, remediation tracking and review reporting.'
    Intro = 'Axentra can manage defined compliance, governance and privacy workflows around evidence, policies, third-party records, remediation and client review requirements.'
    Fit = 'Compliance, privacy, legal operations and business teams that need consistent evidence trails, ownership records and follow-up routines.'
    Manage = @('Policy and control trackers','Evidence request administration','Privacy request records','Third-party risk files','Remediation action logs','Governance meeting materials')
    Outputs = @('Evidence indexes','Control status trackers','Privacy request logs','Remediation reports','Review-ready governance packs')
    Dependencies = 'Client teams provide policy standards, control ownership, approval rules and regulatory interpretations. Advice and final compliance positions remain with the client.'
    Structure = 'Scope may be organised by control area, business unit, policy family, third-party group or remediation programme.'
    Related = @('kyc-kyb-aml-onboarding','legal-technology-ai-workflows','process-sop-quality-support')
  },
  [pscustomobject]@{
    Group = 'legal'; Slug = 'case-matter-records-management'; Name = 'Case, Matter and Records Management'
    Meta = 'Managed case, matter and records workflows for opening, document indexes, status records, handovers, reporting and closure.'
    Intro = 'Axentra can manage case, matter and records workflows from file setup through status reporting, handover and closure.'
    Fit = 'Legal departments and service portfolios where records are dispersed, status is difficult to retrieve or handovers depend on individual knowledge.'
    Manage = @('Matter opening and file setup','Document indexing and naming routines','Status and ownership trackers','Missing-item follow-up','Handover records','Closure and archive administration')
    Outputs = @('Matter indexes','Document maps','Status reports','Exception logs','Handover and archive packs')
    Dependencies = 'Client teams provide matter rules, repository access, retention instructions and approval paths. Retention decisions and regulated responsibilities remain with the client.'
    Structure = 'Work may begin with one matter type or repository and extend to a wider portfolio after naming, ownership and reporting standards are agreed.'
    Related = @('ediscovery-investigations-document-review','bankruptcy-case-operations','property-lease-operations')
  },
  [pscustomobject]@{
    Group = 'legal'; Slug = 'deal-diligence-transaction-support'; Name = 'Deal, Diligence and Transaction Support'
    Meta = 'Managed transaction workflows for diligence requests, data rooms, signing packs, closing records, conditions and post-closing actions.'
    Intro = 'Axentra can coordinate defined diligence and transaction workflows around requests, data rooms, signing packs, closing records and post-closing actions.'
    Fit = 'Legal, corporate and investment teams managing transactions with multiple document streams, contributors, dependencies and deadlines.'
    Manage = @('Diligence request lists','Data room indexes and permissions records','Document and issue trackers','Signing pack coordination','Closing checklist administration','Post-closing action logs')
    Outputs = @('Diligence status reports','Data room indexes','Issue and dependency trackers','Closing packs','Post-closing action reports')
    Dependencies = 'Client teams provide transaction scope, access rules, diligence criteria, decision owners and approval routes. Legal and commercial conclusions remain with the client.'
    Structure = 'Scope may be organised by transaction, workstream, document category, diligence phase or closing timetable.'
    Related = @('contract-commercial-operations','case-matter-records-management','process-sop-quality-support')
  },
  [pscustomobject]@{
    Group = 'business'; Slug = 'finance-invoicing-legal-spend'; Name = 'Finance, Invoicing and Legal Spend Operations'
    Meta = 'Managed finance, invoicing and legal spend operations for intake, coding review, billing records, accruals, exceptions and reporting.'
    Intro = 'Axentra can manage defined invoice, billing, legal spend and finance workflows within client systems, approval rules and reporting cycles.'
    Fit = 'Finance, legal operations and business teams that need added capacity around invoice handling, spend records, exceptions and month-end reporting.'
    Manage = @('Invoice intake and coding review','Billing tracker updates','Accounts payable and receivable records','Legal spend trackers','Accrual file preparation','Exception and follow-up logs')
    Outputs = @('Invoice status reports','Spend tracker updates','Accrual packs','Exception summaries','Month-end review files')
    Dependencies = 'Client teams provide billing rules, finance system access, approval limits and escalation routes. Payment decisions, audit positions and financial certification remain with the client.'
    Structure = 'Scope may be organised by invoice type, vendor group, spend category, business unit or reporting cycle.'
    Related = @('contract-commercial-operations','mortgage-lending-default-operations','legal-technology-ai-workflows')
  },
  [pscustomobject]@{
    Group = 'business'; Slug = 'kyc-kyb-aml-onboarding'; Name = 'KYC, KYB, AML and Onboarding'
    Meta = 'Managed KYC, KYB, AML and onboarding workflows for document collection, ownership records, screening notes, exceptions and review packs.'
    Intro = 'Axentra can manage defined onboarding workflows around document collection, ownership records, screening notes, exceptions and periodic review packs.'
    Fit = 'Compliance, operations, finance and commercial teams handling recurring customer, vendor or counterparty onboarding volumes.'
    Manage = @('Onboarding checklists','Document collection follow-up','Ownership and control records','Screening notes under client rules','Exception and escalation logs','Periodic review trackers')
    Outputs = @('Onboarding status reports','Ownership summaries','Screening files','Exception reports','Review-ready packs')
    Dependencies = 'Client teams provide acceptance criteria, screening tools, risk rules, approval owners and escalation requirements. Risk acceptance and regulated decisions remain with the client.'
    Structure = 'Scope may be organised by entity type, jurisdiction, risk tier, onboarding stage or review cycle.'
    Related = @('compliance-governance-privacy','contract-commercial-operations','process-sop-quality-support')
  },
  [pscustomobject]@{
    Group = 'business'; Slug = 'mortgage-lending-default-operations'; Name = 'Mortgage, Lending and Default Operations'
    Meta = 'Managed mortgage, lending and default operations for loan files, document records, status tracking, exceptions and portfolio reporting.'
    Intro = 'Axentra can manage loan file, mortgage, servicing and default workflows around records, status, exceptions and review-ready reporting.'
    Fit = 'Lenders, servicers and operations teams managing portfolios where file volumes and follow-up requirements affect visibility.'
    Manage = @('Loan file indexing','Mortgage document records','Default status trackers','Exception follow-up logs','Borrower and account record packs','Portfolio reporting')
    Outputs = @('Loan file maps','Default workflow trackers','Missing-document reports','Exception summaries','Review-ready account files')
    Dependencies = 'Client teams provide servicing rules, system access, document standards and escalation requirements. Credit, recovery and legal decisions remain with the client.'
    Structure = 'Scope may be organised by portfolio, account stage, loan type, document category or reporting period.'
    Related = @('bankruptcy-case-operations','finance-invoicing-legal-spend','property-lease-operations')
  },
  [pscustomobject]@{
    Group = 'business'; Slug = 'property-lease-operations'; Name = 'Property and Lease Operations'
    Meta = 'Managed property and lease operations for lease files, tenant and vendor records, renewals, obligations, requests and portfolio reporting.'
    Intro = 'Axentra can manage lease and property workflows around files, tenant and vendor records, renewals, obligations and reporting.'
    Fit = 'Property, facilities, legal and finance teams managing leases, vendors, tenants and obligations across multiple records.'
    Manage = @('Lease file organisation','Tenant and vendor record updates','Renewal and notice trackers','Obligation and clause logs','Document request follow-up','Portfolio reporting packs')
    Outputs = @('Lease abstracts for review','Renewal trackers','Obligation reports','Vendor record packs','Missing-document logs')
    Dependencies = 'Client teams provide lease standards, repository access, approval rules and business instructions. Lease interpretation, negotiation and legal decisions remain with the client.'
    Structure = 'Scope may be organised by property portfolio, lease type, vendor group, renewal cycle or reporting requirement.'
    Related = @('contract-commercial-operations','case-matter-records-management','finance-invoicing-legal-spend')
  },
  [pscustomobject]@{
    Group = 'workflow'; Slug = 'legal-technology-ai-workflows'; Name = 'Legal Technology and AI Workflow Enablement'
    Meta = 'Legal technology and AI workflow enablement for process mapping, data fields, testing, client-approved tools, human validation and reporting.'
    Intro = 'Axentra helps structure legal technology and AI-assisted workflows around the client''s existing systems, approved use cases, controls and review model.'
    Fit = 'Teams introducing workflow tools, contract repositories, matter systems, dashboards or AI-assisted activities that need clear operating requirements.'
    Manage = @('Workflow and requirements mapping','Data fields and taxonomy alignment','Playbook and prompt library administration','Test cases and issue capture','AI-output validation routines','Dashboard and reporting inputs')
    Outputs = @('Workflow maps','Field dictionaries','Testing reports','Prompt and playbook logs','Exception and validation summaries')
    Dependencies = 'Client teams provide approved tools, security requirements, information rules, system access, use-case boundaries and approval points. Technology, legal and regulatory decisions remain with the client.'
    Structure = 'An engagement may begin with one agreed use case, move through testing and validation, and expand only after controls and review responsibilities are confirmed.'
    Related = @('process-sop-quality-support','contract-commercial-operations','compliance-governance-privacy')
    AiNote = 'AI and automation may be incorporated into agreed activities such as information extraction, classification, document preparation, testing and reporting. The approach depends on the client''s approved tools, information requirements, security environment and review model. AI-assisted outputs remain subject to the validation and approval arrangements agreed for the engagement.'
  },
  [pscustomobject]@{
    Group = 'workflow'; Slug = 'process-sop-quality-support'; Name = 'Process Design, SOP and Quality Support'
    Meta = 'Process design, SOP and quality workflows covering process maps, instructions, checklists, review routines, exceptions and delivery reporting.'
    Intro = 'Axentra structures process maps, SOPs, checklists, review routines, exception routes and reporting for defined legal and business workflows.'
    Fit = 'Teams preparing a workflow for transition, standardising delivery across contributors or responding to repeated quality findings.'
    Manage = @('Current-state process mapping','Future-state workflow design','SOP and work-instruction drafting','Checklist and review routine design','Exception and escalation routes','Quality and delivery reporting')
    Outputs = @('Process maps','SOPs and work instructions','Review checklists','Exception matrices','Quality and delivery reports')
    Dependencies = 'Client teams provide current instructions, system context, decision owners, quality expectations and approval requirements. Final process ownership remains with the client.'
    Structure = 'Work may be delivered as a defined design project, a transition workstream or part of a wider managed workflow.'
    Related = @('legal-technology-ai-workflows','contract-commercial-operations','ediscovery-investigations-document-review')
  }
)

$servicesBySlug = @{}
foreach ($service in $services) { $servicesBySlug[$service.Slug] = $service }

$homeMain = @"
      <section class="home-hero">
        <div class="container home-hero-content">
          <p class="eyebrow">Legal and Business Operations Managed Services</p>
          <h1>Managed delivery configured around the way your work runs</h1>
          <p class="hero-lead">Axentra combines domain teams, structured delivery and AI-assisted execution across legal and business workflows. Each engagement is aligned to the client's existing processes, systems, instructions, access controls and review requirements.</p>
          <div class="button-row">
            <a class="button light" href="$BasePath/contact.html">Discuss a Workflow</a>
            <a class="button outline-light" href="$BasePath/services/">Explore Managed Services</a>
          </div>
          <p class="service-line">Contracts &middot; eDiscovery &middot; Compliance &middot; Case Operations &middot; Finance &middot; Lending &middot; Workflow Technology</p>
        </div>
      </section>
      <section class="section" id="service-groups">
        <div class="container">
          <div class="section-heading">
            <p class="eyebrow">What We Manage</p>
            <h2>Managed services across legal and business operations</h2>
            <p>Services are configured around the client's existing workflows, systems, instructions and delivery requirements.</p>
          </div>
          <div class="service-group-grid">
            <article class="service-group-card accent-blue">
              <h3>Legal Managed Services</h3>
              <p>Contracts, eDiscovery, bankruptcy, compliance, case management and transaction operations.</p>
              <a class="text-link" href="$BasePath/services/#legal-services">Explore Legal Managed Services</a>
            </article>
            <article class="service-group-card accent-teal">
              <h3>Business Process Managed Services</h3>
              <p>Finance, invoicing, onboarding, lending, default, property and lease operations.</p>
              <a class="text-link" href="$BasePath/services/#business-process-services">Explore Business Process Managed Services</a>
            </article>
            <article class="service-group-card accent-purple">
              <h3>Workflow, Technology and AI Enablement</h3>
              <p>Process design, system readiness, testing, AI-assisted workflows, quality controls and adoption.</p>
              <a class="text-link" href="$BasePath/services/#workflow-enablement">Explore Workflow Enablement</a>
            </article>
          </div>
        </div>
      </section>
      <section class="section section-muted how-preview">
        <div class="container compact-split">
          <div>
            <p class="eyebrow">How We Work</p>
            <h2>Delivery configured around the work</h2>
          </div>
          <div>
            <p>Axentra agrees the scope, team, systems, controls, review points, reporting and escalation routes before delivery begins.</p>
            <a class="button secondary" href="$BasePath/how-we-work.html">See How We Work</a>
          </div>
        </div>
      </section>
      <section class="section questions-preview">
        <div class="container">
          <div class="section-heading inline-heading">
            <div><p class="eyebrow">Latest Questions</p><h2>Answers for evaluating the model</h2></div>
            <a class="button secondary" href="$BasePath/insights/">View Insights &amp; FAQs</a>
          </div>
          <div class="question-link-grid">
            <a href="$BasePath/insights/#faq-ai"><span>AI and delivery controls</span><strong>How does Axentra use AI in legal and business workflows?</strong></a>
            <a href="$BasePath/insights/#faq-engagement"><span>Starting an engagement</span><strong>How does an engagement begin?</strong></a>
          </div>
        </div>
      </section>
      <section class="contact-band">
        <div class="container contact-band-inner">
          <div><p class="eyebrow">Start a Discussion</p><h2>Discuss a workflow or service requirement</h2><p>Share the process, current operating context and the type of delivery requirement you are considering.</p></div>
          <a class="button light" href="$BasePath/contact.html">Contact Axentra</a>
        </div>
      </section>
"@

$schema = @"
    <script type="application/ld+json">
      {"@context":"https://schema.org","@type":"Organization","name":"Axentra Solutions Pvt. Ltd.","url":"$SiteUrl/","logo":"$SiteUrl/assets/images/axentra-solutions-logo.jpeg","email":"info@axentrabusiness.com","telephone":"+91 97250 24355","description":"India-based, AI-enabled legal and business operations managed services company.","sameAs":["https://www.linkedin.com/company/axentra-solutions-pvt-ltd/","https://www.linkedin.com/in/gagan-prajapati-6b3439a5/","https://www.linkedin.com/in/pooja-gore-99712723b/"]}
    </script>
"@

Write-SiteFile -Path 'index.html' -Content (Get-Page -Title 'Axentra | AI-Enabled Legal and Business Operations' -Description 'Axentra provides AI-enabled legal managed services and business process operations across contracts, compliance, eDiscovery, bankruptcy, finance, lending, property and legal technology.' -Canonical "$SiteUrl/" -Active 'home' -Main $homeMain -BodyClass 'home-page' -AdditionalHead $schema)

$groupLinks = @{}
foreach ($groupName in @('legal','business','workflow')) {
  $groupLinks[$groupName] = (($services | Where-Object Group -eq $groupName) | ForEach-Object { '<a href="{0}/services/{1}.html"><span>{2}</span><span aria-hidden="true">&#8594;</span></a>' -f $BasePath, $_.Slug, $_.Name }) -join "`n"
}

$servicesMain = @"
      <section class="page-hero">
        <div class="container narrow">
          <p class="eyebrow">Legal and Business Operations Managed Services</p>
          <h1>Services shaped around the work you need to run</h1>
          <p>Axentra provides managed legal services, business process operations and workflow enablement across contracts, compliance, case support, eDiscovery, bankruptcy, finance, lending, property, transactions and legal technology.</p>
          <p>Delivery is configured around the client's existing processes, tools, instructions, access requirements and review structure.</p>
          <a class="button primary" href="$BasePath/contact.html">Discuss a Service Requirement</a>
        </div>
      </section>
      <section class="section service-group-section" id="legal-services">
        <div class="container group-layout">
          <div><p class="eyebrow">Legal Managed Services</p><h2>Alternative legal services for defined legal workflows</h2><p>Delivery is organised around client instructions, systems, review points and authorised decision-makers.</p></div>
          <div class="service-link-list">$($groupLinks.legal)</div>
        </div>
      </section>
      <section class="section section-muted service-group-section" id="business-process-services">
        <div class="container group-layout">
          <div><p class="eyebrow">Business Process Managed Services</p><h2>Business process operations with clear ownership and reporting</h2><p>Recurring operational work can be configured by process, portfolio, business unit or reporting cycle.</p></div>
          <div class="service-link-list">$($groupLinks.business)</div>
        </div>
      </section>
      <section class="section service-group-section" id="workflow-enablement">
        <div class="container group-layout">
          <div><p class="eyebrow">Workflow and Technology Enablement</p><h2>Process and technology prepared for controlled execution</h2><p>AI-assisted execution is used only for agreed use cases within client-approved tools and review controls.</p></div>
          <div class="service-link-list">$($groupLinks.workflow)</div>
        </div>
      </section>
      <section class="contact-band">
        <div class="container contact-band-inner"><div><p class="eyebrow">Discuss Scope</p><h2>Review a service requirement with Axentra</h2><p>Share the workflow, systems, expected outputs and review requirements.</p></div><a class="button light" href="$BasePath/contact.html">Contact Axentra</a></div>
      </section>
"@

Write-SiteFile -Path 'services/index.html' -Content (Get-Page -Title 'Legal and Business Operations Managed Services | Axentra' -Description 'Explore Axentra managed services across alternative legal services, business process operations, workflow technology and AI-assisted execution.' -Canonical "$SiteUrl/services/" -Active 'services' -Main $servicesMain)

foreach ($service in $services) {
  $manageItems = ($service.Manage | ForEach-Object { "<li>$_</li>" }) -join "`n"
  $outputItems = ($service.Outputs | ForEach-Object { "<li>$_</li>" }) -join "`n"
  $serviceGroupEyebrow = switch ($service.Group) {
    'legal' { 'Legal Managed Services' }
    'business' { 'Business Process Managed Services' }
    default { 'Workflow and Technology Enablement' }
  }
  $relatedItems = ($service.Related | ForEach-Object {
    $related = $servicesBySlug[$_]
    '<li><a href="{0}/services/{1}.html">{2}</a></li>' -f $BasePath, $related.Slug, $related.Name
  }) -join "`n"
  $aiSection = if ($service.PSObject.Properties.Name -contains 'AiNote') { '<section class="service-content-block ai-note"><h2>AI-assisted execution</h2><p>{0}</p></section>' -f $service.AiNote } else { '' }

  $serviceMain = @"
      <section class="page-hero service-hero">
        <div class="container narrow">
          <p class="eyebrow">$serviceGroupEyebrow</p>
          <h1>$($service.Name)</h1>
          <p>$($service.Intro)</p>
          <a class="button primary" href="$BasePath/contact.html">Discuss This Workflow</a>
        </div>
      </section>
      <section class="section">
        <div class="container service-layout">
          <div class="service-main">
            <section class="service-content-block"><h2>Where the service may fit</h2><p>$($service.Fit)</p></section>
            <section class="service-content-block"><h2>What Axentra can manage</h2><ul class="check-list">$manageItems</ul></section>
            <section class="service-content-block"><h2>Potential outputs</h2><ul class="check-list">$outputItems</ul></section>
            $aiSection
            <section class="service-content-block"><h2>Client inputs and dependencies</h2><p>$($service.Dependencies)</p></section>
            <section class="service-content-block"><h2>How an engagement may be structured</h2><p>$($service.Structure)</p></section>
          </div>
          <aside class="service-aside" aria-label="Related services">
            <h2>Related services</h2>
            <ul>$relatedItems</ul>
            <a class="text-link" href="$BasePath/services/">View all managed services</a>
          </aside>
        </div>
      </section>
      <section class="contact-band">
        <div class="container contact-band-inner"><div><p class="eyebrow">Discuss This Workflow</p><h2>Review the scope, systems and delivery requirement</h2><p>Share the current process for $($service.Name), including expected outputs, dependencies and review points.</p></div><a class="button light" href="$BasePath/contact.html">Contact Axentra</a></div>
      </section>
"@

  Write-SiteFile -Path "services/$($service.Slug).html" -Content (Get-Page -Title "$($service.Name) | Axentra" -Description $service.Meta -Canonical "$SiteUrl/services/$($service.Slug).html" -Active 'services' -Main $serviceMain)
}

$workMain = @"
      <section class="page-hero">
        <div class="container narrow"><p class="eyebrow">How We Work</p><h1>How delivery is structured</h1><p>The delivery model is configured around the work, systems, access requirements, review points and level of operating responsibility agreed with the client.</p></div>
      </section>
      <section class="section">
        <div class="container">
          <div class="section-heading"><p class="eyebrow">Delivery Stages</p><h2>Scope and controls are agreed before delivery begins</h2></div>
          <ol class="stage-grid">
            <li><span>01</span><h3>Define</h3><p>Confirm the workflow, activities, responsibilities, systems, volumes, dependencies and intended outputs.</p></li>
            <li><span>02</span><h3>Configure</h3><p>Agree the team structure, instructions, access, controls, review requirements, reporting and escalation routes.</p></li>
            <li><span>03</span><h3>Transition</h3><p>Complete knowledge transfer, training, system readiness, pilot checks and initial delivery validation.</p></li>
            <li><span>04</span><h3>Run and Review</h3><p>Manage the agreed workflow, maintain visibility over delivery and exceptions, and review the model using client feedback and operating information.</p></li>
          </ol>
        </div>
      </section>
      <section class="section section-muted">
        <div class="container compact-split">
          <div><p class="eyebrow">Engagement Formats</p><h2>Start at the level the workflow requires</h2><p>The format depends on scope, duration, operating responsibility and the level of transition required.</p></div>
          <div class="format-list"><div><strong>Defined project</strong><span>Time-bound scope and outputs.</span></div><div><strong>Bounded pilot</strong><span>A controlled test of one workflow or use case.</span></div><div><strong>Managed workflow</strong><span>Ongoing delivery under agreed instructions and reporting.</span></div><div><strong>Dedicated delivery team</strong><span>Assigned capacity for a defined service portfolio.</span></div></div>
        </div>
      </section>
      <section class="contact-band"><div class="container contact-band-inner"><div><p class="eyebrow">Configure Delivery</p><h2>Discuss the workflow and operating context</h2><p>Axentra can review the scope, systems, controls and transition requirements with your team.</p></div><a class="button light" href="$BasePath/contact.html">Discuss a Workflow</a></div></section>
"@

Write-SiteFile -Path 'how-we-work.html' -Content (Get-Page -Title 'How Axentra Structures Managed Delivery | Axentra' -Description 'See how Axentra defines, configures, transitions, runs and reviews legal and business operations managed services.' -Canonical "$SiteUrl/how-we-work.html" -Active 'work' -Main $workMain)

$aboutMain = @"
      <section class="page-hero">
        <div class="container narrow"><p class="eyebrow">About Axentra</p><h1>Legal and business operations delivered through a model shaped around the client</h1><p>Axentra Solutions Pvt. Ltd. is an India-based legal and business operations managed services company. Our work spans alternative legal services, business process operations and workflow enablement.</p><p>Engagements are configured around the client's existing processes, systems, instructions, access requirements, review points and operating priorities.</p><div class="button-row"><a class="button primary" href="$BasePath/services/">Explore Managed Services</a><a class="button secondary" href="$BasePath/contact.html">Discuss a Workflow</a></div></div>
      </section>
      <section class="section">
        <div class="container">
          <div class="section-heading"><p class="eyebrow">Delivery Model</p><h2>How delivery is organised</h2><p>Day-to-day work is managed by Axentra's service leads, domain professionals, delivery teams and quality reviewers. The structure is adapted to the scope, required skills, systems, volumes, review requirements and reporting needs of each engagement.</p><p>Leadership provides company direction, governance and accountability. Delivery responsibility sits with the team assigned to the engagement rather than with one individual.</p></div>
          <div class="delivery-role-grid"><article><h3>Service leadership</h3><p>Scope ownership, client coordination and escalation.</p></article><article><h3>Domain capability</h3><p>Professionals aligned to the workflow and instructions.</p></article><article><h3>Delivery teams</h3><p>Assigned capacity for agreed activities and outputs.</p></article><article><h3>Quality and reporting</h3><p>Review routines, exceptions and delivery visibility.</p></article></div>
        </div>
      </section>
      <section class="section section-muted" id="leadership">
        <div class="container">
          <div class="section-heading"><p class="eyebrow">Leadership</p><h2>Company direction and accountability</h2></div>
          <div class="leadership-grid">
            <article class="leader-card"><p class="role">Founder</p><h3>Gagan Prajapati</h3><p>Gagan Prajapati is the Founder of Axentra Solutions. He focuses on company direction, partnerships and governance, while client delivery is managed through Axentra's service and operations teams.</p><div class="leader-links"><a href="mailto:gagan.prajapati@axentrabusiness.com">gagan.prajapati@axentrabusiness.com</a><a href="https://www.linkedin.com/in/gagan-prajapati-6b3439a5/" target="_blank" rel="noopener noreferrer">Connect with Gagan on LinkedIn</a></div></article>
            <article class="leader-card"><p class="role">Co-founder</p><h3>Pooja Gore</h3><p>Pooja Gore is Co-founder of Axentra Solutions. She contributes to business development, client engagement and the shaping of service models around each client's workflows, systems and operating requirements.</p><div class="leader-links"><a href="mailto:pooja.gore@axentrabusiness.com">pooja.gore@axentrabusiness.com</a><a href="https://www.linkedin.com/in/pooja-gore-99712723b/" target="_blank" rel="noopener noreferrer">Connect with Pooja on LinkedIn</a></div></article>
          </div>
        </div>
      </section>
      <section class="contact-band"><div class="container contact-band-inner"><div><p class="eyebrow">Explore the Model</p><h2>Review where Axentra may fit</h2><p>Start with a defined workflow, service requirement or bounded pilot.</p></div><a class="button light" href="$BasePath/contact.html">Discuss a Workflow</a></div></section>
"@

Write-SiteFile -Path 'about.html' -Content (Get-Page -Title 'About Axentra | Legal and Business Operations Managed Services' -Description 'Learn how Axentra structures legal and business operations managed services around client workflows, systems, requirements and delivery priorities.' -Canonical "$SiteUrl/about.html" -Active 'about' -Main $aboutMain)

$faqs = @(
  [pscustomobject]@{ id='faq-ai'; faq_question='How does Axentra use AI in legal and business workflows?'; faq_answer='AI and automation may be used in agreed activities such as information extraction, classification, document preparation, testing and reporting. Use depends on client-approved tools, information and security requirements, and the agreed review model. AI-assisted outputs remain subject to human validation and client approval points.'; related_linkedin_title=''; related_linkedin_url=''; related_service_title='Legal Technology and AI Workflow Enablement'; related_service_url="$BasePath/services/legal-technology-ai-workflows.html" },
  [pscustomobject]@{ id='faq-systems'; faq_question='Does Axentra require clients to change their systems or processes?'; faq_answer='No. Axentra begins with the client''s existing workflows, systems, instructions and access model. Process or technology changes are considered only where they are relevant to the agreed requirement and approved by the client.'; related_linkedin_title='Operational design for scalable business operations'; related_linkedin_url='https://www.linkedin.com/posts/axentra-solutions-pvt-ltd_axentrasolutions-alsp-legaloperations-activity-7459630423296479233-0-J5'; related_service_title='Process Design, SOP and Quality Support'; related_service_url="$BasePath/services/process-sop-quality-support.html" },
  [pscustomobject]@{ id='faq-partial-workflow'; faq_question='Can Axentra manage only one part of a workflow?'; faq_answer='Yes. Scope can cover one activity, a defined workstream, a bounded pilot or an end-to-end managed workflow. Responsibilities, hand-offs, dependencies and review points are agreed before work begins.'; related_linkedin_title=''; related_linkedin_url=''; related_service_title='How We Work'; related_service_url="$BasePath/how-we-work.html" },
  [pscustomobject]@{ id='faq-contract-operations'; faq_question='What can Axentra manage across contract operations?'; faq_answer='Depending on the agreed scope, Axentra can manage contract intake, drafting from approved templates, first-level review preparation, negotiation trackers, execution coordination, repositories, metadata, renewals and obligation records. Legal judgement and final approvals remain with the client.'; related_linkedin_title='Vendor contract review from clauses to operations'; related_linkedin_url='https://www.linkedin.com/posts/axentra-solutions-pvt-ltd_vendor-contract-review-from-clauses-to-operations-activity-7475593440907653120-kHWk'; related_service_title='Contract Lifecycle and Commercial Operations'; related_service_url="$BasePath/services/contract-commercial-operations.html" },
  [pscustomobject]@{ id='faq-quality'; faq_question='What can repeated quality-control findings indicate?'; faq_answer='Repeated findings may point to unclear inputs, inconsistent instructions, missing ownership, weak review routines, training needs or system issues. The appropriate response depends on the pattern, impact and operating context rather than one isolated result.'; related_linkedin_title=''; related_linkedin_url=''; related_service_title='Process Design, SOP and Quality Support'; related_service_url="$BasePath/services/process-sop-quality-support.html" },
  [pscustomobject]@{ id='faq-bankruptcy'; faq_question='How can Axentra assist with bankruptcy and case operations?'; faq_answer='Axentra can manage defined activities such as docket monitoring records, claim files, case indexes, deadlines, exceptions and status reporting under client instructions. Legal strategy, filing decisions and professional judgement remain with the client''s authorised professionals.'; related_linkedin_title=''; related_linkedin_url=''; related_service_title='Bankruptcy and Case Operations'; related_service_url="$BasePath/services/bankruptcy-case-operations.html" },
  [pscustomobject]@{ id='faq-delivery-team'; faq_question='Who handles day-to-day delivery?'; faq_answer='Day-to-day work is handled by the service leads, domain professionals, delivery teams and quality reviewers assigned to the engagement. Leadership provides company direction, governance and accountability without making delivery dependent on one individual.'; related_linkedin_title=''; related_linkedin_url=''; related_service_title='About Axentra'; related_service_url="$BasePath/about.html" },
  [pscustomobject]@{ id='faq-markets'; faq_question='Does Axentra work with clients in India and international markets?'; faq_answer='Axentra is India-based and can structure engagements for Indian and international clients. Fit depends on the workflow, jurisdictional context, information-access requirements, review model and any client-specific operating constraints.'; related_linkedin_title=''; related_linkedin_url=''; related_service_title='Managed Services'; related_service_url="$BasePath/services/" },
  [pscustomobject]@{ id='faq-engagement'; faq_question='How does an engagement begin?'; faq_answer='A discussion begins with the workflow, current operating context, systems, expected outputs, dependencies and review requirements. Axentra then helps define a suitable scope and engagement format, such as a project, bounded pilot, managed workflow or dedicated delivery team.'; related_linkedin_title=''; related_linkedin_url=''; related_service_title='Contact Axentra'; related_service_url="$BasePath/contact.html" }
)

$faqMarkup = foreach ($faq in $faqs) {
  $linkedInMarkup = if ($faq.related_linkedin_url) { '<div class="faq-related"><span>Related on LinkedIn:</span><strong>{0}</strong><a href="{1}" target="_blank" rel="noopener noreferrer">View the LinkedIn post</a></div>' -f $faq.related_linkedin_title, $faq.related_linkedin_url } else { '' }
  @"
<article class="faq-item" id="$($faq.id)">
  <h2><button class="faq-question" type="button" id="$($faq.id)-button" aria-expanded="false" aria-controls="$($faq.id)-answer"><span>$($faq.faq_question)</span><span class="faq-indicator" aria-hidden="true"></span></button></h2>
  <div class="faq-answer" id="$($faq.id)-answer" role="region" aria-labelledby="$($faq.id)-button" hidden><p>$($faq.faq_answer)</p><p class="faq-service-link">Related: <a href="$($faq.related_service_url)">$($faq.related_service_title)</a></p>$linkedInMarkup</div>
</article>
"@
}

$insightsMain = @"
      <section class="page-hero">
        <div class="container narrow"><p class="eyebrow">Axentra Insights</p><h1>Insights and frequently asked questions</h1><p>Clear answers on Axentra's services, delivery model, use of AI and approach to legal and business operations.</p><div class="button-row"><a class="button primary" href="$BasePath/contact.html">Discuss a Workflow</a><a class="button secondary" href="https://www.linkedin.com/company/axentra-solutions-pvt-ltd/" target="_blank" rel="noopener noreferrer">Follow Axentra on LinkedIn</a></div></div>
      </section>
      <section class="section faq-section">
        <div class="container faq-shell">
          <div class="section-heading"><p class="eyebrow">Frequently Asked Questions</p><h2>Evaluate the service and delivery model</h2></div>
          <div class="faq-list">$($faqMarkup -join "`n")</div>
        </div>
      </section>
      <section class="section" id="latest-insights" aria-label="Latest Insights" hidden></section>
"@

Write-SiteFile -Path 'insights/index.html' -Content (Get-Page -Title 'Axentra Insights and FAQs | Legal and Business Operations' -Description 'Answers and analysis on Axentra''s legal and business operations managed services, AI use, delivery models, contracts, quality controls and case operations.' -Canonical "$SiteUrl/insights/" -Active 'insights' -Main $insightsMain)

$contactMain = @"
      <section class="page-hero contact-hero">
        <div class="container narrow"><p class="eyebrow">Contact Axentra</p><h1>Discuss a workflow, service requirement or pilot</h1><p>Share the process, current operating context, systems involved and where additional capacity or managed delivery may be useful.</p><a class="button primary" href="mailto:info@axentrabusiness.com">Email Axentra</a></div>
      </section>
      <section class="section">
        <div class="container contact-grid">
          <div class="contact-primary"><p class="eyebrow">General Enquiries</p><h2>Start with the requirement</h2><p><a href="mailto:info@axentrabusiness.com">info@axentrabusiness.com</a></p><p><a href="tel:+919725024355">+91 97250 24355</a></p><p><a href="https://www.linkedin.com/company/axentra-solutions-pvt-ltd/" target="_blank" rel="noopener noreferrer">Axentra on LinkedIn</a></p></div>
          <div><p class="eyebrow">Leadership Contacts</p><div class="contact-people"><article><h2>Gagan Prajapati</h2><p>Founder</p><a href="mailto:gagan.prajapati@axentrabusiness.com">gagan.prajapati@axentrabusiness.com</a></article><article><h2>Pooja Gore</h2><p>Co-founder</p><a href="mailto:pooja.gore@axentrabusiness.com">pooja.gore@axentrabusiness.com</a></article></div></div>
        </div>
      </section>
"@

Write-SiteFile -Path 'contact.html' -Content (Get-Page -Title 'Contact Axentra | Discuss a Managed Workflow' -Description 'Contact Axentra to discuss a legal or business operations workflow, managed service requirement, defined project or bounded pilot.' -Canonical "$SiteUrl/contact.html" -Active 'contact' -Main $contactMain)

Write-SiteFile -Path 'founder.html' -Content (Get-RedirectPage -Title 'About Axentra' -Description 'Leadership information for Axentra is available on the About Axentra page.' -Canonical "$SiteUrl/about.html" -Target "$BasePath/about.html#leadership" -Heading 'Leadership information has moved' -Copy 'Gagan Prajapati and Pooja Gore are presented together on the About Axentra page.' -LinkLabel 'View About Axentra')
Write-SiteFile -Path 'services.html' -Content (Get-RedirectPage -Title 'Managed Services | Axentra' -Description 'Axentra managed services are available in the dedicated services hub.' -Canonical "$SiteUrl/services/" -Target "$BasePath/services/" -Heading 'Managed Services has moved' -Copy 'View Axentra legal managed services, business process operations and workflow enablement in the services hub.' -LinkLabel 'View Managed Services')
Write-SiteFile -Path 'service-lines.html' -Content (Get-RedirectPage -Title 'Managed Services | Axentra' -Description 'Axentra service lines are available in the Managed Services hub.' -Canonical "$SiteUrl/services/" -Target "$BasePath/services/" -Heading 'Service lines have moved' -Copy 'Each service line now has a dedicated page within Managed Services.' -LinkLabel 'View Managed Services')
Write-SiteFile -Path 'operating-model.html' -Content (Get-RedirectPage -Title 'How We Work | Axentra' -Description 'Axentra''s delivery model is presented on the How We Work page.' -Canonical "$SiteUrl/how-we-work.html" -Target "$BasePath/how-we-work.html" -Heading 'The delivery model has moved' -Copy 'Define, configure, transition, run and review are now set out on the How We Work page.' -LinkLabel 'View How We Work')
Write-SiteFile -Path 'insights.html' -Content (Get-RedirectPage -Title 'Axentra Insights and FAQs' -Description 'Axentra Insights is now an accessible frequently asked questions library.' -Canonical "$SiteUrl/insights/" -Target "$BasePath/insights/" -Heading 'Insights and FAQs has moved' -Copy 'Answers on services, delivery, AI and operating requirements are available in the Insights and FAQ library.' -LinkLabel 'View Insights and FAQs')

$articleRedirects = @(
  @{ Path='insights/ai-governance-india-operating-controls.html'; Target="$BasePath/insights/#faq-ai"; Heading='AI governance answer has moved'; Copy='The answer now sits in the Axentra FAQ library.'; Link='Read the AI FAQ' },
  @{ Path='insights/bankruptcy-workflow-capacity.html'; Target="$BasePath/insights/#faq-bankruptcy"; Heading='Bankruptcy operations answer has moved'; Copy='The answer now sits in the Axentra FAQ library.'; Link='Read the bankruptcy FAQ' },
  @{ Path='insights/contract-decision-context.html'; Target="$BasePath/insights/#faq-contract-operations"; Heading='Contract operations answer has moved'; Copy='The answer now sits in the Axentra FAQ library.'; Link='Read the contract operations FAQ' },
  @{ Path='insights/vendor-contract-operating-model.html'; Target="$BasePath/insights/#faq-contract-operations"; Heading='Vendor contract answer has moved'; Copy='The answer now sits in the Axentra FAQ library.'; Link='Read the contract operations FAQ' },
  @{ Path='insights/quality-control-operating-signals.html'; Target="$BasePath/insights/#faq-quality"; Heading='Quality-control answer has moved'; Copy='The answer now sits in the Axentra FAQ library.'; Link='Read the quality-control FAQ' }
)
foreach ($redirect in $articleRedirects) {
  Write-SiteFile -Path $redirect.Path -Content (Get-RedirectPage -Title "$($redirect.Heading) | Axentra" -Description $redirect.Copy -Canonical "$SiteUrl/insights/" -Target $redirect.Target -Heading $redirect.Heading -Copy $redirect.Copy -LinkLabel $redirect.Link)
}

$sitemapUrls = @(
  "$SiteUrl/",
  "$SiteUrl/services/",
  "$SiteUrl/how-we-work.html",
  "$SiteUrl/about.html",
  "$SiteUrl/insights/",
  "$SiteUrl/contact.html"
) + ($services | ForEach-Object { "$SiteUrl/services/$($_.Slug).html" })
$sitemapEntries = ($sitemapUrls | ForEach-Object { "  <url><loc>$_</loc><lastmod>2026-07-13</lastmod></url>" }) -join "`n"
$sitemap = @"
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
$sitemapEntries
</urlset>
"@
Write-SiteFile -Path 'sitemap.xml' -Content $sitemap

$readme = @'
# Axentra Solutions website

Public website for Axentra Solutions Pvt. Ltd., covering legal and business operations managed services, delivery structure, leadership, FAQs and contact routes.

Preview: https://legalworkflowlab.github.io/axentra-solutions-website/

Run `tools/build-site.ps1` from PowerShell to regenerate the static HTML pages after editing shared page data or templates.
'@
Write-SiteFile -Path 'README.md' -Content $readme

"Generated $($services.Count) service pages and the shared site pages."
