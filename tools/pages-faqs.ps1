$faqs = @(
  [pscustomobject]@{G='General';Q='What services does Axentra provide?';A='Axentra provides Bankruptcy Operations, Mortgage Servicing and Default Operations, Contract and Commercial Operations, Product and AI Operations, Defined Legal Support and Workflow Assessment.'},
  [pscustomobject]@{G='General';Q='Who does Axentra work with?';A='The operating model is designed for law firms, legal departments, lenders, servicers, product teams and commercial functions with document-heavy, calculation-sensitive or deadline-driven workflows.'},
  [pscustomobject]@{G='General';Q='Does Axentra provide legal advice or representation?';A='No. Axentra is not a law firm and does not provide legal advice, legal representation or court appearances. Legal decisions remain with the client and its authorised professionals.'},
  [pscustomobject]@{G='General';Q='How does an engagement begin?';A='It begins with the workflow trigger, source information, systems, decisions, exceptions, outputs and review requirements. Axentra then documents scope, responsibilities, controls and transition dependencies.'},
  [pscustomobject]@{G='General';Q='How does Axentra prevent context from being lost?';A='The delivery record links the source, instruction, calculation or work, owner, deadline, review point, exception, evidence and status.'},
  [pscustomobject]@{G='General';Q='How are exceptions handled?';A='Missing information, deviations and unresolved questions are recorded, assigned and routed through the agreed escalation path instead of being left in informal messages.'},
  [pscustomobject]@{G='General';Q='What happens when client instructions change?';A='The change is recorded, affected work is identified, instructions and quality checks are updated, and open items are recalibrated with the client.'},
  [pscustomobject]@{G='General';Q='How is a workflow assessed before transition?';A='Axentra maps the trigger, inputs, systems, roles, client decisions, delivery activities, exceptions, controls and evidence that confirms completion.'},
  [pscustomobject]@{G='General';Q='What information remains visible to the client?';A='The agreed reporting model surfaces status, ownership, deadlines, dependencies, exceptions, review items and completion evidence.'},
  [pscustomobject]@{G='General';Q='How are quality findings used?';A='Findings are classified and reviewed for recurring causes. They inform instruction, training, workflow, quality-rule and product-feedback changes agreed with the client.'},

  [pscustomobject]@{G='Bankruptcy';Q='What pre-filing bankruptcy work does Axentra support?';A='The public scope covers intake administration, document collation, information validation, source indexing, approved-system data preparation, missing-item tracking and attorney-review packages.'},
  [pscustomobject]@{G='Bankruptcy';Q='What bankruptcy calculations does Axentra support?';A='Scope includes income, Chapter 7 and Chapter 13 worksheet support, asset and liability reconciliation, filing-fee records and calculation quality controls using approved methods and current source data.'},
  [pscustomobject]@{G='Bankruptcy';Q='Does Axentra decide whether a debtor qualifies for Chapter 7 or Chapter 13?';A='No. Chapter selection, eligibility and legal conclusions remain within the attorney-led client process.'},
  [pscustomobject]@{G='Bankruptcy';Q='Does Axentra select exemptions?';A='No. Exemption data is entered or reconciled only under attorney instruction. Axentra does not select exemptions or advise on asset treatment.'},
  [pscustomobject]@{G='Bankruptcy';Q='What filing-readiness work does Axentra support?';A='Support includes form and schedule assembly, cross-form reconciliation, document and signature tracking, redaction checks, filing-package organisation and an attorney-review tracker.'},
  [pscustomobject]@{G='Bankruptcy';Q='What happens after a case is filed?';A='Post-filing administration connects docket events, trustee requests, deadlines, claims, amendments, payments, hearings and closure records to the client file and responsible owner.'},
  [pscustomobject]@{G='Bankruptcy';Q='Does Axentra support trustee document requests?';A='Trustee-request tracking and document-package administration are within the described scope, subject to client instructions and confirmed access. Axentra does not represent a party at meetings.'},
  [pscustomobject]@{G='Bankruptcy';Q='Does Axentra monitor PACER and court dockets?';A='Docket-monitoring support is configured only after the PACER or court-access model, permitted role and escalation procedure are confirmed with the client.'},
  [pscustomobject]@{G='Bankruptcy';Q='Does Axentra support claims administration?';A='The described scope includes claim collection, abstraction, matching, classification, comparison, reconciliation and deadline reporting under authorised review.'},
  [pscustomobject]@{G='Bankruptcy';Q='Does Axentra support creditors and mortgage servicers in bankruptcy?';A='The service includes operational support for notice intake, loan and case matching, claim records, payment monitoring, critical dates and system reconciliation.'},
  [pscustomobject]@{G='Bankruptcy';Q='Does Axentra prepare proofs of claim?';A='Axentra supports proof-of-claim data, reconciliation and document packages within the client process. Signature, filing approval and legal positions remain with authorised professionals.'},
  [pscustomobject]@{G='Bankruptcy';Q='Does Axentra provide legal representation?';A='No. Axentra does not represent debtors, creditors, lenders or servicers, appear in court or provide litigation strategy.'},

  [pscustomobject]@{G='Mortgage';Q='What mortgage workflows does Axentra support?';A='The published scope covers loan-document onboarding, account reconciliation, delinquency records, loss-mitigation administration, foreclosure milestone tracking and bankruptcy interface.'},
  [pscustomobject]@{G='Mortgage';Q='What mortgage calculations does Axentra support?';A='Support includes principal, interest, escrow, advances, suspense, arrears, reinstatement, payoff and payment-history worksheets using client-approved servicing methods.'},
  [pscustomobject]@{G='Mortgage';Q='Does Axentra make lending decisions?';A='No. Axentra does not make credit, underwriting, lending or investor decisions.'},
  [pscustomobject]@{G='Mortgage';Q='Does Axentra approve or deny loss mitigation?';A='No. Eligibility, credit, legal and investor decisions remain with the authorised lender, servicer, investor or counsel process.'},
  [pscustomobject]@{G='Mortgage';Q='Does Axentra conduct foreclosure?';A='No. Axentra supports document readiness, referrals, milestones, records and reporting. It does not conduct foreclosure, sign pleadings or provide foreclosure strategy.'},
  [pscustomobject]@{G='Mortgage';Q='Does Axentra collect borrower payments?';A='The public scope does not include receiving funds, applying payments or conducting collection calls.'},
  [pscustomobject]@{G='Mortgage';Q='How are mortgage and bankruptcy workflows connected?';A='A bankruptcy filing changes servicing actions, claims, payments, legal holds and loan-system records. Each workflow keeps its own controls while sharing matched case and loan information.'},
  [pscustomobject]@{G='Mortgage';Q='Does Axentra provide title opinions?';A='No. Document and title-report administration does not constitute title certification, a title opinion or title advice.'},
  [pscustomobject]@{G='Mortgage';Q='Does Axentra support mortgage proof-of-claim preparation?';A='The described scope includes claim data, mortgage attachment support, balance and arrears reconciliation, payment history and the supporting-document package under authorised review.'},
  [pscustomobject]@{G='Mortgage';Q='Does Axentra support post-foreclosure workflows?';A='Post-foreclosure and property-transition activities are excluded from the standard public scope until capability, role and licensing requirements are separately confirmed.'},

  [pscustomobject]@{G='Contracts and commercial data';Q='What stages of the contract lifecycle does Axentra support?';A='Scope covers pre-execution intake and review preparation, execution coordination, and post-execution repository, metadata, obligation, renewal, amendment and reporting work.'},
  [pscustomobject]@{G='Contracts and commercial data';Q='What commercial information does Axentra abstract?';A='Examples include fees, variable charges, revenue share, indexation, rebates, credits, milestones, caps, thresholds, taxes and reconciliation rights.'},
  [pscustomobject]@{G='Contracts and commercial data';Q='How are commercial conditions and dependencies captured?';A='Each value is linked to its trigger, basis, threshold, frequency, effective period, adjustment, dependency, exception, notice, owner, evidence and review status.'},
  [pscustomobject]@{G='Contracts and commercial data';Q='Does Axentra manage renewals, obligations and amendments?';A='Those records form part of post-execution support when included in the agreed repository, ownership and reporting scope.'},
  [pscustomobject]@{G='Contracts and commercial data';Q='Does Axentra provide contract negotiation support?';A='Axentra supports approved-template drafting, clause comparison, redline tracking and approval coordination. Negotiating positions, legal judgement and final approval remain with the client.'},

  [pscustomobject]@{G='Product and AI Operations';Q='What UAT services does Axentra provide?';A='Domain and business UAT covers requirements, user journeys, workflows, roles, permissions, documents, approvals, reports, defects, retesting and release evidence.'},
  [pscustomobject]@{G='Product and AI Operations';Q='Does Axentra provide technical or security testing?';A='No. The service does not include source-code, penetration, performance, security or automated testing.'},
  [pscustomobject]@{G='Product and AI Operations';Q='How does Axentra validate AI clause extraction?';A='Validation compares the extracted clause, classification, boundaries, parties, dates, conditions, exceptions, amendments and commercial terms with the source document.'},
  [pscustomobject]@{G='Product and AI Operations';Q='How does Axentra validate AI-generated summaries?';A='Review checks source accuracy, missing conditions, unsupported conclusions, party attribution, defined terms, amendments, dates, values, dependencies and intended-user suitability.'},
  [pscustomobject]@{G='Product and AI Operations';Q='How are recurring AI errors analysed?';A='Errors are classified by type, field, clause structure, document hierarchy and scenario so repeated patterns inform logic, prompt, playbook and test recommendations.'},
  [pscustomobject]@{G='Product and AI Operations';Q='Does Axentra modify or retrain AI models?';A='No model-training or retraining capability is claimed. Recommendations go to the client team responsible for legal, product, data or engineering implementation.'},
  [pscustomobject]@{G='Product and AI Operations';Q='What is regression testing?';A='Regression testing reruns agreed scenarios after a change to check that corrected behaviour remains stable and previously working behaviour has not been affected.'},
  [pscustomobject]@{G='Product and AI Operations';Q='What product teams does Axentra support?';A='The service is designed for legal, contract, commercial and property technology teams that need domain-led workflow and output assurance.'},

  [pscustomobject]@{G='Security';Q='How does Axentra protect confidential information?';A='The delivery model links confidentiality requirements to people, vendor, access, approved-system, handling, review, incident and closure controls agreed for the engagement.'},
  [pscustomobject]@{G='Security';Q='What controls apply to employees and vendors?';A='Relevant obligations address confidentiality, data protection, intellectual property, information security, AI use, access restrictions, incidents, return, deletion and continuing duties.'},
  [pscustomobject]@{G='Security';Q='What IT asset controls are maintained?';A='The applicable asset and access model is evidenced during diligence. Specific endpoint, MFA, VPN, VDI, encryption and media-control claims are not published until verified.'},
  [pscustomobject]@{G='Security';Q='Does Axentra hold ISO, SOC 2 or HIPAA certification?';A='The website does not claim ISO 27001, SOC 2, HIPAA or another independent certification.'},
  [pscustomobject]@{G='Security';Q='Does Axentra process protected health information?';A='Any PHI engagement requires the parties, permitted use, safeguards, access environment, incident duties and Business Associate Agreement requirements to be settled before processing.'},
  [pscustomobject]@{G='Security';Q='How does Axentra use AI?';A='AI use follows client instructions, contractual restrictions, approved tools, data minimisation, access controls, review and escalation. Client data is not put into unauthorised public AI tools.'},
  [pscustomobject]@{G='Security';Q='May a client prohibit AI use?';A='Yes. Client instructions and contractual restrictions determine whether AI is permitted for an engagement or activity.'},
  [pscustomobject]@{G='Security';Q='Does Axentra use subcontractors?';A='Subcontractor use is engagement-specific and must be disclosed, authorised where required and covered by relevant contractual restrictions before access is provided.'},
  [pscustomobject]@{G='Security';Q='What happens when a person leaves?';A='The agreed offboarding process addresses access suspension or removal, asset return, record handling, continuing obligations and evidence of completion.'},
  [pscustomobject]@{G='Security';Q='What happens when an engagement ends?';A='Closure addresses access removal, open-work handover, client records, retention, return or deletion, asset actions and completion evidence under the agreement.'},

  [pscustomobject]@{G='Commercial';Q='What engagement models are available?';A='An engagement may be structured as a defined project, bounded pilot, managed workflow or dedicated delivery team after scope and dependencies are understood.'},
  [pscustomobject]@{G='Commercial';Q='How is pricing determined?';A='Pricing depends on scope, volume, variability, complexity, systems, access, skills, review effort, reporting and transition requirements. No outcome or saving is guaranteed.'},
  [pscustomobject]@{G='Commercial';Q='What information should be shared during the first discussion?';A='Share the workflow trigger, current process, approximate workload, systems, source documents, required outputs, review owners, exceptions and deadlines. Do not send confidential client files initially.'}
)

$faqGroups = @('General','Bankruptcy','Mortgage','Contracts and commercial data','Product and AI Operations','Security','Commercial')
$faqSections = foreach ($group in $faqGroups) {
  $groupSlug = ($group.ToLowerInvariant() -replace '[^a-z0-9]+','-').Trim('-')
  $items = $faqs | Where-Object G -eq $group
  $itemMarkup = foreach ($faq in $items) {
    $faqIndex = [array]::IndexOf($faqs, $faq) + 1
    @"
<details class="faq-item" id="faq-$faqIndex">
  <summary><span>$($faq.Q)</span><span class="summary-marker" aria-hidden="true"></span></summary>
  <div class="faq-answer"><p>$($faq.A)</p></div>
</details>
"@
  }
  @"
<section class="faq-group" id="$groupSlug">
  <div class="faq-group-heading"><p class="eyebrow">$group</p><h2>$($items.Count) questions</h2></div>
  <div class="faq-list">$($itemMarkup -join "`n")</div>
</section>
"@
}

$faqEntity = @($faqs | ForEach-Object {
  [ordered]@{
    '@type' = 'Question'
    name = $_.Q
    acceptedAnswer = [ordered]@{'@type'='Answer'; text=$_.A}
  }
})
$faqSchemaObject = [ordered]@{'@context'='https://schema.org'; '@type'='FAQPage'; mainEntity=$faqEntity}
$faqSchema = '    <script type="application/ld+json">{0}</script>' -f ($faqSchemaObject | ConvertTo-Json -Depth 8 -Compress)

$faqNav = ($faqGroups | ForEach-Object {
  $slug = ($_.ToLowerInvariant() -replace '[^a-z0-9]+','-').Trim('-')
  '<a href="#{0}">{1}</a>' -f $slug, $_
}) -join "`n"

$faqsMain = @"
<section class="page-hero editorial-hero"><div class="container narrow"><p class="eyebrow">Frequently asked questions</p><h1>Direct answers about scope, roles and controls</h1><p class="lead">Concise answers for evaluating Axentra's services, workflow model, operating boundaries and information requirements.</p></div></section>
<nav class="faq-category-nav" aria-label="FAQ categories"><div class="container">$faqNav</div></nav>
<section class="section faq-library"><div class="container narrow">$($faqSections -join "`n")</div></section>
$(Get-ContactBand -Heading 'Still evaluating a specific workflow?' -Copy 'Share the trigger, records, systems, review responsibility, approximate workload and completion evidence required.')
"@

Write-SiteFile -Path 'faqs.html' -Content (Get-Page -Title 'FAQs | Axentra' -Description 'Answers about Axentra bankruptcy, mortgage, contract, product and AI operations, security controls, engagement models and professional boundaries.' -Canonical "$SiteUrl/faqs.html" -Active 'faqs' -Main $faqsMain -BodyClass 'faqs-page' -AdditionalHead $faqSchema)
