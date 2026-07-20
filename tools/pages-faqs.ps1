$faqs = @(
  [pscustomobject]@{G='General';Q='What services does Axentra provide?';A='Axentra provides Bankruptcy Operations, Mortgage Servicing and Default Operations, Contract and Commercial Operations, Legal Tech and AI Quality Support, and Defined Legal Support. Workflow Assessment is available when the work or delivery approach needs to be defined first.'},
  [pscustomobject]@{G='General';Q='Who does Axentra work with?';A='Axentra supports law firms, in-house legal and business teams, lenders, servicers, legal-technology companies, contract-technology providers and property-technology businesses.'},
  [pscustomobject]@{G='General';Q='Does Axentra provide legal advice or representation?';A='No. Axentra is not a law firm and does not provide legal advice, legal representation or court appearances. Legal decisions remain with the client and its authorised professionals.'},
  [pscustomobject]@{G='General';Q='How does an engagement begin?';A='Axentra reviews the work, volumes, duration, systems, client working hours, expected output and review responsibilities. The parties then agree the team, instructions, access, quality checks, reporting and escalation routes.'},
  [pscustomobject]@{G='General';Q='How does Axentra prevent information from being lost?';A='The delivery record keeps the source information, instruction, work completed, owner, deadline, review point, open item and status together.'},
  [pscustomobject]@{G='General';Q='How are missing information and open questions handled?';A='Missing information, deviations and unresolved questions are recorded, assigned and raised through the escalation route set for the engagement.'},
  [pscustomobject]@{G='General';Q='What happens when client instructions change?';A='The change is recorded, affected work is identified, instructions and quality checks are updated, and open items are reviewed with the client.'},
  [pscustomobject]@{G='General';Q='How is a workflow assessed before transition?';A='Axentra reviews the work, volumes, systems, data, people, deadlines, expected output, review responsibilities and delivery coverage needed.'},
  [pscustomobject]@{G='General';Q='What information remains visible to the client?';A='Reporting can cover status, ownership, deadlines, dependencies, open questions, review items and completed work, according to the engagement.'},
  [pscustomobject]@{G='General';Q='How are quality findings used?';A='Recurring findings are reviewed with the client and used to improve instructions, training, quality checks and delivery.'},

  [pscustomobject]@{G='Bankruptcy';Q='What pre-filing bankruptcy work does Axentra support?';A='The public scope covers intake administration, document collation, information validation, source indexing, approved-system data preparation, missing-item tracking and attorney-review packages.'},
  [pscustomobject]@{G='Bankruptcy';Q='What bankruptcy calculations does Axentra support?';A='Scope includes income, Chapter 7 and Chapter 13 worksheet support, asset and liability reconciliation, filing-fee records and calculation quality controls using approved methods and current source data.'},
  [pscustomobject]@{G='Bankruptcy';Q='Does Axentra decide whether a debtor qualifies for Chapter 7 or Chapter 13?';A='No. Chapter selection, eligibility and legal conclusions remain within the attorney-led client process.'},
  [pscustomobject]@{G='Bankruptcy';Q='Does Axentra select exemptions?';A='No. Exemption data is entered or reconciled only under attorney instruction. Axentra does not select exemptions or advise on asset treatment.'},
  [pscustomobject]@{G='Bankruptcy';Q='What filing-readiness work does Axentra support?';A='Support includes form and schedule assembly, cross-form reconciliation, document and signature tracking, redaction checks, filing-package organisation and an attorney-review tracker.'},
  [pscustomobject]@{G='Bankruptcy';Q='What happens after a case is filed?';A='Post-filing administration connects docket events, trustee requests, deadlines, claims, amendments, payments, hearings and closure records to the client file and responsible owner.'},
  [pscustomobject]@{G='Bankruptcy';Q='Does Axentra support trustee document requests?';A='Yes. Support can include request tracking, document collection, package organisation and status reporting under client instructions. Axentra does not represent a party at meetings.'},
  [pscustomobject]@{G='Bankruptcy';Q='Does Axentra monitor PACER and court dockets?';A='Docket support includes PACER monitoring where the client provides the access arrangement and instructions.'},
  [pscustomobject]@{G='Bankruptcy';Q='Does Axentra support claims administration?';A='Support can include claim collection, abstraction, matching, classification, comparison, reconciliation and deadline reporting under the client review process.'},
  [pscustomobject]@{G='Bankruptcy';Q='Does Axentra support creditors and mortgage servicers in bankruptcy?';A='The service includes operational support for notice intake, loan and case matching, claim records, payment monitoring, critical dates and system reconciliation.'},
  [pscustomobject]@{G='Bankruptcy';Q='Does Axentra prepare proofs of claim?';A='Axentra supports proof-of-claim data, reconciliation and document packages within the client process. Signature, filing approval and legal positions remain with authorised professionals.'},
  [pscustomobject]@{G='Bankruptcy';Q='Does Axentra provide legal representation?';A='No. Axentra does not represent debtors, creditors, lenders or servicers, appear in court or provide litigation strategy.'},

  [pscustomobject]@{G='Mortgage';Q='What mortgage workflows does Axentra support?';A='Support covers loan-document review, account reconciliation, delinquency records, loss-mitigation administration, foreclosure tracking, bankruptcy and post-foreclosure records.'},
  [pscustomobject]@{G='Mortgage';Q='What mortgage calculations does Axentra support?';A='Support includes principal, interest, escrow, advances, suspense, arrears, reinstatement, payoff and payment-history worksheets using client-approved servicing methods.'},
  [pscustomobject]@{G='Mortgage';Q='Does Axentra make lending decisions?';A='No. Axentra does not make credit, underwriting, lending or investor decisions.'},
  [pscustomobject]@{G='Mortgage';Q='Does Axentra approve or deny loss mitigation?';A='No. Eligibility, credit, legal and investor decisions remain with the authorised lender, servicer, investor or counsel process.'},
  [pscustomobject]@{G='Mortgage';Q='Does Axentra conduct foreclosure?';A='No. Axentra supports document readiness, referrals, milestones, records and reporting. It does not conduct foreclosure, sign pleadings or provide foreclosure strategy.'},
  [pscustomobject]@{G='Mortgage';Q='Does Axentra collect borrower payments?';A='The public scope does not include receiving funds, applying payments or conducting collection calls.'},
  [pscustomobject]@{G='Mortgage';Q='How are mortgage and bankruptcy workflows connected?';A='A bankruptcy filing changes servicing actions, claims, payments, legal holds and loan-system records. Each workflow keeps its own controls while sharing matched case and loan information.'},
  [pscustomobject]@{G='Mortgage';Q='Does Axentra provide title opinions?';A='No. Document and title-report administration does not constitute title certification, a title opinion or title advice.'},
  [pscustomobject]@{G='Mortgage';Q='Does Axentra support mortgage proof-of-claim preparation?';A='The described scope includes claim data, mortgage attachment support, balance and arrears reconciliation, payment history and the supporting-document package under authorised review.'},
  [pscustomobject]@{G='Mortgage';Q='Does Axentra support post-foreclosure records?';A='Yes. Administrative support can cover sale results, title and vesting records, possession milestones, property records, expenses, recoveries, REO file records and final account reconciliation. Decisions remain with the responsible client or provider.'},

  [pscustomobject]@{G='Contracts and commercial data';Q='What stages of the contract lifecycle does Axentra support?';A='Scope covers pre-execution intake and review preparation, execution coordination, and post-execution repository, metadata, obligation, renewal, amendment and reporting work.'},
  [pscustomobject]@{G='Contracts and commercial data';Q='What commercial information does Axentra abstract?';A='Examples include fees, variable charges, revenue share, indexation, rebates, credits, milestones, caps, thresholds, taxes and reconciliation rights.'},
  [pscustomobject]@{G='Contracts and commercial data';Q='How are commercial conditions and dependencies captured?';A='Each value is linked to its trigger, basis, threshold, frequency, effective period, adjustment, dependency, exception, notice, owner, evidence and review status.'},
  [pscustomobject]@{G='Contracts and commercial data';Q='Does Axentra manage renewals, obligations and amendments?';A='Those records form part of post-execution support when included in the agreed repository, ownership and reporting scope.'},
  [pscustomobject]@{G='Contracts and commercial data';Q='Does Axentra provide contract negotiation support?';A='Axentra supports approved-template drafting, clause comparison, redline tracking and approval coordination. Negotiating positions, legal judgement and final approval remain with the client.'},

  [pscustomobject]@{G='Legal Tech and AI Quality Support';Q='What business-user testing does Axentra provide?';A='Axentra tests agreed user journeys, document upload, data fields, workflow routing, approvals, alerts, reminders and user-facing reports. Issues are recorded and corrected items are retested. This is commonly called user acceptance testing, or UAT.'},
  [pscustomobject]@{G='Legal Tech and AI Quality Support';Q='Does Axentra provide technical or security testing?';A='No. The service does not include source-code, penetration, performance or cybersecurity testing, and it is not a full software QA service.'},
  [pscustomobject]@{G='Legal Tech and AI Quality Support';Q='How does Axentra validate AI clause extraction?';A='Axentra compares the clause or field, value, classification, conditions, missing information, amendments, source reference and commercial dependencies with the source document.'},
  [pscustomobject]@{G='Legal Tech and AI Quality Support';Q='How does Axentra validate AI-generated summaries?';A='The review checks that a summary reflects the source and preserves relevant conditions, qualifications, dates, amounts and party responsibilities.'},
  [pscustomobject]@{G='Legal Tech and AI Quality Support';Q='How are recurring AI errors analysed?';A='Corrections are grouped to identify fields, clauses, document types or wording patterns that continue to produce errors or require high levels of manual review.'},
  [pscustomobject]@{G='Legal Tech and AI Quality Support';Q='Does Axentra modify or retrain AI models?';A='No. Axentra does not retrain AI models, develop AI, change source code or own release decisions. Findings are shared with the client team responsible for updates.'},
  [pscustomobject]@{G='Legal Tech and AI Quality Support';Q='What happens after corrections are made?';A='Updated outputs or user journeys are retested against the source document or expected business result. Further issues are recorded and shared with the client team.'},
  [pscustomobject]@{G='Legal Tech and AI Quality Support';Q='What technology businesses does Axentra support?';A='The service supports legal, contract and property technology businesses that need business-user testing or human review of AI-extracted clauses, summaries and commercial data.'},

  [pscustomobject]@{G='Security';Q='How does Axentra protect confidential information?';A='Security responsibilities are addressed through employment and vendor obligations, policies, workforce training, approved devices, system access and engagement-specific data-handling instructions.'},
  [pscustomobject]@{G='Security';Q='What controls apply to employees and vendors?';A='Relevant obligations address confidentiality, data protection, intellectual property, information security, AI use, access restrictions, incidents, return, deletion and continuing duties.'},
  [pscustomobject]@{G='Security';Q='What IT asset and access controls are maintained?';A='Each engagement identifies the permitted devices, user roles, systems, software, downloads, storage and remote-working arrangements. Access is changed or removed when a role or assignment ends.'},
  [pscustomobject]@{G='Security';Q='Does Axentra hold ISO, SOC 2 or HIPAA certification?';A='The website does not claim ISO 27001, SOC 2, HIPAA or another independent certification.'},
  [pscustomobject]@{G='Security';Q='Does Axentra process protected health information?';A='Any PHI engagement requires the parties, permitted use, safeguards, access environment, incident duties and Business Associate Agreement requirements to be settled before processing.'},
  [pscustomobject]@{G='Security';Q='How does Axentra use AI?';A='AI use follows client instructions, contractual restrictions, approved tools, data minimisation, access controls, review and escalation. Client data is not put into unauthorised public AI tools.'},
  [pscustomobject]@{G='Security';Q='May a client prohibit AI use?';A='Yes. Client instructions and contractual restrictions determine whether AI is permitted for an engagement or activity.'},
  [pscustomobject]@{G='Security';Q='Does Axentra use subcontractors?';A='Subcontractor use is engagement-specific. Relevant use is disclosed, authorised where required and covered by contract restrictions before access is provided.'},
  [pscustomobject]@{G='Security';Q='What happens when a person leaves?';A='The agreed offboarding process addresses access suspension or removal, asset return, record handling, continuing obligations and evidence of completion.'},
  [pscustomobject]@{G='Security';Q='What happens when an engagement ends?';A='Closure addresses access removal, open-work handover, client records, retention, return or deletion, asset actions and completion evidence under the agreement.'},

  [pscustomobject]@{G='Commercial';Q='What engagement options are available?';A='Support may be arranged as on-demand support, a defined project, a managed recurring workflow, a dedicated team or a secondment.'},
  [pscustomobject]@{G='Commercial';Q='How is pricing determined?';A='Pricing depends on the work type, volume, variability, systems, access, experience needed, review effort, reporting, working hours and duration. No outcome or saving is guaranteed.'},
  [pscustomobject]@{G='Commercial';Q='What information is useful during the first discussion?';A='Share the work type, approximate volumes, duration, systems, source documents, expected output, review responsibilities, working hours and deadlines. Do not send confidential client files initially.'}
)

$faqGroups = @('General','Bankruptcy','Mortgage','Contracts and commercial data','Legal Tech and AI Quality Support','Security','Commercial')
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
<section class="page-hero editorial-hero"><div class="container narrow"><p class="eyebrow">Frequently asked questions</p><h1>Answers about Axentra's services and delivery</h1><p class="lead">Find practical information about service scope, engagement options, client responsibilities, security and the first discussion.</p></div></section>
<nav class="faq-category-nav" aria-label="FAQ categories"><div class="container">$faqNav</div></nav>
<section class="section faq-library"><div class="container narrow">$($faqSections -join "`n")</div></section>
$(Get-ContactBand -Heading 'Have a question about a specific requirement?' -Copy 'Share the work type, volumes, systems, working hours, duration and review responsibilities.')
"@

Write-SiteFile -Path 'faqs.html' -Content (Get-Page -Title 'FAQs | Axentra' -Description 'Answers about Axentra bankruptcy, mortgage, contract, legal tech and AI quality services, engagement options, security and professional boundaries.' -Canonical "$SiteUrl/faqs.html" -Active 'faqs' -Main $faqsMain -BodyClass 'faqs-page' -AdditionalHead $faqSchema)
