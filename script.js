const siteHeader = document.querySelector(".site-header");
const navToggle = document.querySelector(".nav-toggle");
const primaryNav = document.querySelector(".primary-nav");
const servicesMenu = document.querySelector(".services-menu");
const servicesToggle = document.querySelector(".services-toggle");
const desktopNavigation = window.matchMedia("(min-width: 1181px)");

const setServicesMenu = (open) => {
  if (!servicesMenu || !servicesToggle) return;
  servicesMenu.classList.toggle("open", open);
  servicesToggle.setAttribute("aria-expanded", String(open));
};

const setPrimaryNav = (open) => {
  if (!primaryNav || !navToggle) return;
  primaryNav.classList.toggle("open", open);
  document.body.classList.toggle("nav-open", open && !desktopNavigation.matches);
  navToggle.setAttribute("aria-expanded", String(open));
  navToggle.setAttribute("aria-label", open ? "Close navigation" : "Open navigation");
  if (!open) setServicesMenu(false);
};

navToggle?.addEventListener("click", () => {
  setPrimaryNav(!primaryNav.classList.contains("open"));
});

servicesToggle?.addEventListener("click", (event) => {
  event.stopPropagation();
  setServicesMenu(!servicesMenu.classList.contains("open"));
});

servicesMenu?.addEventListener("mouseenter", () => {
  if (desktopNavigation.matches) setServicesMenu(true);
});

servicesMenu?.addEventListener("mouseleave", () => {
  if (desktopNavigation.matches && !servicesMenu.contains(document.activeElement)) {
    setServicesMenu(false);
  }
});

servicesMenu?.addEventListener("focusout", (event) => {
  if (desktopNavigation.matches && !servicesMenu.contains(event.relatedTarget)) {
    setServicesMenu(false);
  }
});

primaryNav?.querySelectorAll("a").forEach((link) => {
  link.addEventListener("click", () => {
    setServicesMenu(false);
    if (!desktopNavigation.matches) setPrimaryNav(false);
  });
});

document.addEventListener("click", (event) => {
  if (servicesMenu && !servicesMenu.contains(event.target)) setServicesMenu(false);
  if (!desktopNavigation.matches && siteHeader && !siteHeader.contains(event.target)) {
    setPrimaryNav(false);
  }
});

document.addEventListener("keydown", (event) => {
  if (event.key !== "Escape") return;

  if (servicesMenu?.classList.contains("open")) {
    setServicesMenu(false);
    servicesToggle?.focus();
    return;
  }

  if (primaryNav?.classList.contains("open")) {
    setPrimaryNav(false);
    navToggle?.focus();
  }
});

desktopNavigation.addEventListener("change", () => {
  setServicesMenu(false);
  setPrimaryNav(false);
});

const openDetailsFromHash = () => {
  const id = window.location.hash.slice(1);
  if (!id) return;

  const target = document.getElementById(id);
  if (target?.tagName === "DETAILS") target.open = true;
};

window.addEventListener("hashchange", openDetailsFromHash);
openDetailsFromHash();

const contactForm = document.querySelector("#contact-form");
const serviceSelect = document.querySelector("#contact-service");
const formStatus = document.querySelector("#form-status");

if (serviceSelect) {
  const serviceMap = {
    bankruptcy: "Bankruptcy Operations",
    mortgage: "Mortgage Servicing and Default Operations",
    contracts: "Contract and Commercial Operations",
    "legal-tech-ai": "Legal Tech and AI Quality Support",
    "defined-legal": "Defined Legal Support",
    assessment: "Workflow Assessment",
  };
  const requestedService = new URLSearchParams(window.location.search).get("service");
  if (requestedService && serviceMap[requestedService]) {
    serviceSelect.value = serviceMap[requestedService];
  }
}

contactForm?.addEventListener("submit", (event) => {
  event.preventDefault();

  if (!contactForm.checkValidity()) {
    contactForm.reportValidity();
    if (formStatus) formStatus.textContent = "Complete the required fields before preparing the email.";
    return;
  }

  const values = Object.fromEntries(new FormData(contactForm).entries());
  const subject = `Axentra service enquiry: ${values.service}`;
  const body = [
    `Name: ${values.name}`,
    `Organisation: ${values.organisation}`,
    `Work email: ${values.email}`,
    `Country or market: ${values.country_market}`,
    `Service required: ${values.service}`,
    `Type of support: ${values.support_type}`,
    `Approximate volume or team requirement: ${values.volume || "Not provided"}`,
    `Preferred working hours or time-zone coverage: ${values.working_hours || "Not provided"}`,
    `Expected duration: ${values.duration || "Not provided"}`,
    "",
    "Brief description:",
    values.description,
  ].join("\n");

  if (formStatus) formStatus.textContent = "Opening your email application.";
  window.location.href = `mailto:info@axentrabusiness.com?subject=${encodeURIComponent(subject)}&body=${encodeURIComponent(body)}`;
});
