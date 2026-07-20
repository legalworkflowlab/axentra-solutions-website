$legacyServices = @(
  [pscustomobject]@{Slug='bankruptcy-case-operations';Title='Bankruptcy and Case Operations';Target="$BasePath/services/bankruptcy-operations.html";TargetLabel='View Bankruptcy Operations';Summary='Earlier service-page structure covering bankruptcy and case records.'},
  [pscustomobject]@{Slug='mortgage-lending-default-operations';Title='Mortgage, Lending and Default Operations';Target="$BasePath/services/mortgage-servicing-default-operations.html";TargetLabel='View Mortgage Servicing and Default Operations';Summary='Earlier combined service-page structure covering mortgage, lending and default records.'},
  [pscustomobject]@{Slug='legal-technology-ai-workflows';Title='Legal Technology and AI Workflow Enablement';Target="$BasePath/services/legal-tech-ai-quality-services.html";TargetLabel='View Legal Tech and AI Quality Services';Summary='Earlier technology-enablement page replaced by the current business-user testing and AI quality-review service.'},
  [pscustomobject]@{Slug='process-sop-quality-support';Title='Process Design, SOP and Quality Support';Target="$BasePath/services/workflow-assessment.html";TargetLabel='View Workflow Assessment';Summary='Earlier process-design page replaced by the current Workflow Assessment service.'},
  [pscustomobject]@{Slug='ediscovery-investigations-document-review';Title='eDiscovery, Investigations and Document Review';Target="$BasePath/services/";TargetLabel='View Current Services';Summary='Earlier standalone service entry removed from the current five-service structure.'},
  [pscustomobject]@{Slug='compliance-governance-privacy';Title='Compliance, Governance and Privacy';Target="$BasePath/security-trust.html";TargetLabel='View Security and Trust';Summary='Earlier standalone service entry removed from the current five-service structure.'},
  [pscustomobject]@{Slug='case-matter-records-management';Title='Case, Matter and Records Management';Target="$BasePath/services/specialist-legal-process-services.html";TargetLabel='View Specialist Legal Process Services';Summary='Earlier standalone service entry consolidated into Specialist Legal Process Services.'},
  [pscustomobject]@{Slug='deal-diligence-transaction-support';Title='Deal, Diligence and Transaction Support';Target="$BasePath/services/specialist-legal-process-services.html";TargetLabel='View Specialist Legal Process Services';Summary='Earlier standalone service entry consolidated into Specialist Legal Process Services.'},
  [pscustomobject]@{Slug='finance-invoicing-legal-spend';Title='Finance, Invoicing and Legal Spend Operations';Target="$BasePath/services/";TargetLabel='View Current Services';Summary='Earlier standalone service entry removed from the current five-service structure.'},
  [pscustomobject]@{Slug='kyc-kyb-aml-onboarding';Title='KYC, KYB, AML and Onboarding';Target="$BasePath/services/";TargetLabel='View Current Services';Summary='Earlier standalone service entry removed from the current five-service structure.'},
  [pscustomobject]@{Slug='property-lease-operations';Title='Property and Lease Operations';Target="$BasePath/services/contract-commercial-operations.html";TargetLabel='View Contract and Commercial Operations';Summary='Earlier standalone service entry replaced by a narrower contract and commercial operating scope.'}
)

$archiveLinks = foreach ($legacy in $legacyServices) {
  '<li><a href="{0}/archive/services/{1}.html">{2}</a></li>' -f $BasePath, $legacy.Slug, $legacy.Title
}

Write-SiteFile -Path 'services/product-ai-operations.html' -Content (Get-RedirectPage -Title 'Legal Tech and AI Quality Services | Axentra' -Description 'Product and AI Operations has been renamed Legal Tech and AI Quality Services.' -Canonical "$SiteUrl/services/legal-tech-ai-quality-services.html" -Target "$BasePath/services/legal-tech-ai-quality-services.html" -Heading 'This service page has been renamed' -Copy 'Business-user testing and AI quality-review services are now described on the Legal Tech and AI Quality Services page.' -LinkLabel 'View Legal Tech and AI Quality Services')
Write-SiteFile -Path 'services/legal-tech-ai-quality-support.html' -Content (Get-RedirectPage -Title 'Legal Tech and AI Quality Services | Axentra' -Description 'Legal Tech and AI Quality Support has been renamed Legal Tech and AI Quality Services.' -Canonical "$SiteUrl/services/legal-tech-ai-quality-services.html" -Target "$BasePath/services/legal-tech-ai-quality-services.html" -Heading 'This service page has been renamed' -Copy 'The current business-user testing and AI validation service is Legal Tech and AI Quality Services.' -LinkLabel 'View Legal Tech and AI Quality Services')
Write-SiteFile -Path 'services/defined-legal-support.html' -Content (Get-RedirectPage -Title 'Specialist Legal Process Services | Axentra' -Description 'Defined Legal Support has been renamed Specialist Legal Process Services.' -Canonical "$SiteUrl/services/specialist-legal-process-services.html" -Target "$BasePath/services/specialist-legal-process-services.html" -Heading 'This service page has been renamed' -Copy 'Research, document review, due diligence and related legal processes are now described under Specialist Legal Process Services.' -LinkLabel 'View Specialist Legal Process Services')

$archiveIndexMain = @"
<section class="page-hero policy-hero"><div class="container narrow"><p class="eyebrow">Content archive</p><h1>Superseded service pages</h1><p>Historical records retained outside the current information architecture. These pages are excluded from search indexing and public navigation.</p></div></section>
<section class="section"><div class="container policy-content"><ul>$($archiveLinks -join "`n")</ul><p><a href="$BasePath/services/">Return to current services</a></p></div></section>
"@
Write-SiteFile -Path 'archive/index.html' -Content (Get-Page -Title 'Content Archive | Axentra' -Description 'Superseded Axentra website content retained outside the current public navigation.' -Canonical "$SiteUrl/archive/" -Active '' -Main $archiveIndexMain -BodyClass 'policy-page archive-page' -NoIndex)

foreach ($legacy in $legacyServices) {
  $archiveMain = @"
<section class="page-hero policy-hero"><div class="container narrow"><p class="eyebrow">Archived service entry</p><h1>$($legacy.Title)</h1><p>$($legacy.Summary)</p></div></section>
<section class="section"><div class="container policy-content"><h2>This is not a current service page</h2><p>The content is retained as a historical website record. It is not included in current navigation, search indexing or the sitemap.</p><p><a href="$($legacy.Target)">$($legacy.TargetLabel)</a></p></div></section>
"@
  Write-SiteFile -Path "archive/services/$($legacy.Slug).html" -Content (Get-Page -Title "$($legacy.Title) | Archived" -Description $legacy.Summary -Canonical "$SiteUrl/archive/services/$($legacy.Slug).html" -Active '' -Main $archiveMain -BodyClass 'policy-page archive-page' -NoIndex)
  Write-SiteFile -Path "services/$($legacy.Slug).html" -Content (Get-RedirectPage -Title "$($legacy.TargetLabel) | Axentra" -Description "This earlier Axentra service page has moved." -Canonical "$SiteUrl$($legacy.Target -replace [regex]::Escape($BasePath),'')" -Target $legacy.Target -Heading 'This service page has been updated' -Copy $legacy.Summary -LinkLabel $legacy.TargetLabel)
}

Write-SiteFile -Path 'founder.html' -Content (Get-RedirectPage -Title 'About Axentra' -Description 'Axentra founder profiles are on the About page.' -Canonical "$SiteUrl/about.html" -Target "$BasePath/about.html#leadership" -Heading 'Leadership information has moved' -Copy 'The current founder profiles are presented together on the About Axentra page.' -LinkLabel 'View About Axentra')
Write-SiteFile -Path 'services.html' -Content (Get-RedirectPage -Title 'Services | Axentra' -Description 'Axentra services are available in the current services hub.' -Canonical "$SiteUrl/services/" -Target "$BasePath/services/" -Heading 'Services has moved' -Copy 'View the five primary services and supporting Workflow Assessment option.' -LinkLabel 'View Services')
Write-SiteFile -Path 'service-lines.html' -Content (Get-RedirectPage -Title 'Services | Axentra' -Description 'Axentra service lines are available in the current services hub.' -Canonical "$SiteUrl/services/" -Target "$BasePath/services/" -Heading 'Service lines have moved' -Copy 'View the five primary services and supporting Workflow Assessment option.' -LinkLabel 'View Services')
Write-SiteFile -Path 'operating-model.html' -Content (Get-RedirectPage -Title 'How We Work | Axentra' -Description 'Axentra delivery process is set out on the How We Work page.' -Canonical "$SiteUrl/how-we-work.html" -Target "$BasePath/how-we-work.html" -Heading 'How Axentra works has moved' -Copy 'The current five-step delivery process and engagement-specific team approach are set out on How We Work.' -LinkLabel 'View How We Work')
Write-SiteFile -Path 'insights.html' -Content (Get-RedirectPage -Title 'Insights | Axentra' -Description 'Axentra Insights is now separate from the FAQ library.' -Canonical "$SiteUrl/insights/" -Target "$BasePath/insights/" -Heading 'Insights has moved' -Copy 'Published Axentra posts are now separate from frequently asked questions.' -LinkLabel 'View Insights')

$articleRedirects = @(
  [pscustomobject]@{Path='insights/ai-governance-india-operating-controls.html';Target="$BasePath/faqs.html#legal-tech-and-ai-quality-services";Heading='Legal tech and AI questions have moved';Link='View Legal Tech and AI FAQs'},
  [pscustomobject]@{Path='insights/bankruptcy-workflow-capacity.html';Target="$BasePath/faqs.html#bankruptcy";Heading='Bankruptcy questions have moved';Link='View Bankruptcy FAQs'},
  [pscustomobject]@{Path='insights/contract-decision-context.html';Target="$BasePath/faqs.html#contracts-and-commercial-data";Heading='Contract questions have moved';Link='View Contract FAQs'},
  [pscustomobject]@{Path='insights/vendor-contract-operating-model.html';Target="$BasePath/insights/";Heading='Contract insight links have moved';Link='View Insights'},
  [pscustomobject]@{Path='insights/quality-control-operating-signals.html';Target="$BasePath/insights/";Heading='Quality insight links have moved';Link='View Insights'}
)
foreach ($article in $articleRedirects) {
  Write-SiteFile -Path $article.Path -Content (Get-RedirectPage -Title "$($article.Heading) | Axentra" -Description 'This earlier website route now points to the current Axentra content.' -Canonical "$SiteUrl$($article.Target -replace [regex]::Escape($BasePath),'')" -Target $article.Target -Heading $article.Heading -Copy 'The earlier route has been replaced by the current Insights or FAQ page.' -LinkLabel $article.Link)
}

$publicUrls = @(
  "$SiteUrl/",
  "$SiteUrl/services/",
  "$SiteUrl/services/bankruptcy-operations.html",
  "$SiteUrl/services/mortgage-servicing-default-operations.html",
  "$SiteUrl/services/contract-commercial-operations.html",
  "$SiteUrl/services/legal-tech-ai-quality-services.html",
  "$SiteUrl/services/specialist-legal-process-services.html",
  "$SiteUrl/services/workflow-assessment.html",
  "$SiteUrl/how-we-work.html",
  "$SiteUrl/security-trust.html",
  "$SiteUrl/about.html",
  "$SiteUrl/insights/",
  "$SiteUrl/faqs.html",
  "$SiteUrl/contact.html",
  "$SiteUrl/privacy-notice.html",
  "$SiteUrl/legal-notice.html",
  "$SiteUrl/accessibility.html"
)
$sitemapEntries = ($publicUrls | ForEach-Object { "  <url><loc>$_</loc><lastmod>2026-07-20</lastmod></url>" }) -join "`n"
$sitemap = @"
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
$sitemapEntries
</urlset>
"@
Write-SiteFile -Path 'sitemap.xml' -Content $sitemap

$robots = @"
User-agent: *
Allow: /
Disallow: $BasePath/archive/

Sitemap: $SiteUrl/sitemap.xml
"@
Write-SiteFile -Path 'robots.txt' -Content $robots

$readme = @'
# Axentra Solutions website

Public multi-page website for Axentra Solutions Pvt. Ltd., an alternative legal and business process services company that works as an extended specialist team for clients in India and international markets.

Preview: https://legalworkflowlab.github.io/axentra-solutions-website/

Run `tools/build-site.ps1` from PowerShell to regenerate the static HTML pages. The site retains the `/axentra-solutions-website` GitHub Pages base path.
'@
Write-SiteFile -Path 'README.md' -Content $readme

$confirmation = @'
# Axentra Website Content Confirmation

This file records claims, service details and security controls that need evidence or founder approval. It is an internal publication-control record, not a public marketing page.

## Status key

- **Included with a boundary:** Described as operational support under client-approved instructions; authority, legal conclusions and outcome claims are expressly excluded.
- **Excluded pending confirmation:** Not presented as a standard public capability.
- **Evidence required:** The public page identifies the control category but does not claim a specific technical implementation or certification.

## Bankruptcy

| Confirmation item | Current treatment |
| --- | --- |
| Chapters supported | Chapter 7 and Chapter 13 calculation and administration support included with attorney-review boundaries. Confirm jurisdiction and chapter coverage. |
| Debtor-side capability | Included with a boundary. Confirm delivery experience, jurisdictions and authorised roles. |
| Creditor-side capability | Included with a boundary. Confirm creditor and servicer engagement experience. |
| Bankruptcy software experience | No products named. Confirm systems before adding names or experience claims. |
| PACER access model | Conditional wording only. Confirm account ownership, credentials, permitted use and audit requirements. |
| Means-test capability | Worksheet and form-data support included; eligibility conclusions excluded. Confirm methods and reviewer qualifications. |
| Chapter 13 calculation capability | Worksheet support included; feasibility and claim treatment decisions excluded. Confirm methods and jurisdictions. |
| Proof-of-claim capability | Data, reconciliation and package support included; signature and filing approval excluded. Confirm role and review path. |
| Petition preparation capability | Form and package preparation support included; attorney approval and filing authority excluded. Confirm exact scope. |
| Filing support authority | Electronic submission is conditional on client-authorised roles. Confirm before any engagement. |
| Trustee-request capability | Administrative tracking and document packages included; representation excluded. Confirm access and process. |
| Claims administration capability | Administrative scope included. Confirm claim types, systems and authorised escalation route. |

## Mortgage

| Confirmation item | Current treatment |
| --- | --- |
| Servicing workflow capability | Performing-loan servicing excluded as a standard public scope pending confirmation. |
| Mortgage systems experience | No systems named. Confirm before adding product or platform claims. |
| Payment reconciliation | Calculation support included; receiving or independently applying payments excluded. Confirm methodology. |
| Escrow reconciliation | Worksheet support included. Confirm source systems and review method. |
| Reinstatement support | Amount-information support included; legal recoverability decisions excluded. Confirm role. |
| Payoff support | Amount-information support included; legal recoverability decisions excluded. Confirm role. |
| Loss-mitigation administration | Administrative support included; eligibility and approval decisions excluded. Confirm investor and regulatory requirements. |
| Foreclosure administration | Operational records and milestones included; foreclosure conduct, pleading signature and strategy excluded. Confirm jurisdictional role. |
| Title-document support | Administrative records included; title opinion and certification excluded. Confirm scope. |
| Bankruptcy interface | Included with links to Bankruptcy Operations. Confirm systems and client reporting. |
| REO support | REO file record administration is described. Brokerage, asset-management and property decisions remain excluded pending confirmation. |
| Borrower communication | Contact-record administration described; collection calls excluded pending confirmation and compliance review. |
| Debt-collection restrictions | Axentra is not presented as a debt collector. Confirm any future activity before publication. |
| Licensing requirements | No mortgage, servicing, collection, foreclosure, title, broker or asset-management licence claimed. Obtain jurisdictional review for any expanded role. |

## Contracts

| Confirmation item | Current treatment |
| --- | --- |
| Drafting scope | Limited to approved templates and review preparation. Confirm contract types and jurisdictions. |
| Negotiation support | Tracking and coordination included; legal judgement and approved positions remain with client. Confirm role. |
| Commercial abstraction capability | Included. Confirm sample fields, quality method and systems before making experience claims. |
| Revenue and rebate data | Included as data categories, without recovery or performance claims. Confirm sector examples. |
| Sponsorship data | Included as a data category. Confirm delivery evidence before adding examples. |
| Lease abstraction | Commercial terms apply to lease administration; no property-management claim. Confirm scope. |
| Post-signature obligation support | Included. Confirm repository, ownership and notification arrangements. |
| CLM systems experience | No CLM products named. Confirm before adding system claims. |

## Legal Tech and AI Quality Services

| Confirmation item | Current treatment |
| --- | --- |
| Business-user testing experience | Business-user testing is described and explained as UAT. Confirm product types and delivery evidence before experience claims. |
| Test-script capability | Not presented as a standalone public capability. Confirm tools and sample artefacts before expanding the service. |
| Defect-management tools | No tools named. Confirm before adding names. |
| AI validation experience | Clause extraction and summary validation described. Confirm products, document types and evidence. |
| Summary-validation experience | Included without accuracy or performance claims. Confirm evidence. |
| Trend-analysis capability | Included. Confirm taxonomy and reporting examples. |
| Logic-recommendation capability | Included as recommendations to client teams; implementation claims excluded. |
| Retesting | Retesting after corrections is included. Broader regression-testing claims are not published. |
| Technical-testing exclusions | Source-code, penetration, performance, cybersecurity and full software QA are expressly excluded. |

## Security

| Confirmation item | Current treatment |
| --- | --- |
| Employment clauses | Control category included. Retain current executed template and evidence. |
| Vendor flow-down clauses | Control category included. Confirm executed vendor terms for each provider. |
| Policies | Policy areas listed; versions, owners and acknowledgement evidence require confirmation. |
| Training | Category included; frequency, curriculum and completion evidence require confirmation. |
| IT asset inventory | Specific implementation excluded pending evidence. |
| Endpoint controls | Specific implementation excluded pending evidence. |
| MFA | Specific implementation excluded pending evidence. |
| VPN | Specific implementation excluded pending evidence. |
| VDI | Specific implementation excluded pending evidence. |
| Encryption | Specific implementation excluded pending evidence. |
| Local-download controls | Specific implementation excluded pending evidence. |
| Removable-media controls | Specific implementation excluded pending evidence. |
| Access reviews | Process category referenced; frequency and evidence require confirmation. |
| Incident process | Response categories included; plan, ownership, testing and notification evidence require confirmation. |
| Business continuity | Category included; plan, recovery objectives and test evidence require confirmation. |
| Data retention | Contract-led approach described; schedule and evidence require confirmation. |
| Secure deletion | Closure requirement described; tooling and evidence require confirmation. |
| Offboarding | Process requirement described; workflow and completion evidence require confirmation. |
| Insurance | Not claimed. Confirm coverage before publication. |
| BAA readiness | Conditional PHI wording only. Confirm legal and operational readiness before processing PHI. |

## Founder approval before expanding public claims

- Detailed bankruptcy software, PACER, chapter, filing and proof-of-claim experience.
- Mortgage platform, performing-loan, borrower-contact, post-foreclosure and REO capability.
- Named contract, CLM, product, testing or defect-management platforms.
- Client names, sectors, matters, volumes, results, accuracy, turnaround or savings.
- Certifications, audit reports, insurance, licences, locations, team size and technical architecture.
- Any AI model training, technical testing, cybersecurity testing or implementation capability.
'@
Write-SiteFile -Path 'CONTENT_CONFIRMATION.md' -Content $confirmation
