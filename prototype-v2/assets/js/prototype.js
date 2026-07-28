const navToggle = document.querySelector(".nav-toggle");
const primaryNav = document.querySelector(".primary-nav");
const servicesNav = document.querySelector(".services-nav");
const servicesTrigger = document.querySelector(".services-trigger");
const desktopNavigation = window.matchMedia("(min-width: 1181px)");

const setServicesMenu = (open) => {
  if (!servicesNav || !servicesTrigger) return;
  servicesNav.classList.toggle("open", open);
  servicesTrigger.setAttribute("aria-expanded", String(open));
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

servicesTrigger?.addEventListener("click", (event) => {
  event.stopPropagation();
  setServicesMenu(!servicesNav.classList.contains("open"));
});

servicesNav?.addEventListener("mouseenter", () => {
  if (desktopNavigation.matches) setServicesMenu(true);
});

servicesNav?.addEventListener("mouseleave", () => {
  if (desktopNavigation.matches && !servicesNav.contains(document.activeElement)) {
    setServicesMenu(false);
  }
});

servicesNav?.addEventListener("focusout", (event) => {
  if (desktopNavigation.matches && !servicesNav.contains(event.relatedTarget)) {
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
  if (servicesNav && !servicesNav.contains(event.target)) setServicesMenu(false);
});

document.addEventListener("keydown", (event) => {
  if (event.key !== "Escape") return;
  if (servicesNav?.classList.contains("open")) {
    setServicesMenu(false);
    servicesTrigger?.focus();
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

const serviceSelect = document.querySelector("#prototype-service");
if (serviceSelect) {
  const requestedService = new URLSearchParams(window.location.search).get("service");
  if (requestedService) {
    const matchingOption = [...serviceSelect.options].find(
      (option) => option.value === requestedService
    );
    if (matchingOption) serviceSelect.value = requestedService;
  }
}

const contactForm = document.querySelector("#prototype-contact-form");
const formStatus = document.querySelector("#prototype-form-status");

contactForm?.addEventListener("submit", (event) => {
  event.preventDefault();

  if (!contactForm.checkValidity()) {
    contactForm.reportValidity();
    if (formStatus) {
      formStatus.textContent = "Complete the required fields before preparing the email.";
    }
    return;
  }

  const values = Object.fromEntries(new FormData(contactForm).entries());
  const subject = `Axentra prototype enquiry: ${values.service}`;
  const body = [
    `Name: ${values.name}`,
    `Organisation: ${values.organisation}`,
    `Work email: ${values.email}`,
    `Country or market: ${values.market}`,
    `Service: ${values.service}`,
    `Engagement type: ${values.engagement}`,
    `Approximate volume or team requirement: ${values.volume || "Not provided"}`,
    `Preferred working hours or time-zone overlap: ${values.hours || "Not provided"}`,
    `Expected duration: ${values.duration || "Not provided"}`,
    "",
    "Requirement:",
    values.requirement,
  ].join("\n");

  if (formStatus) formStatus.textContent = "Opening your email application.";
  window.location.href =
    `mailto:info@axentrabusiness.com?subject=${encodeURIComponent(subject)}` +
    `&body=${encodeURIComponent(body)}`;
});

document.querySelectorAll("[data-current-year]").forEach((element) => {
  element.textContent = String(new Date().getFullYear());
});

const openDetailsFromHash = () => {
  const id = window.location.hash.slice(1);
  if (!id) return;
  const target = document.getElementById(id);
  if (target?.tagName === "DETAILS") {
    target.open = true;
    requestAnimationFrame(() => target.scrollIntoView({ block: "start" }));
  }
};

window.addEventListener("hashchange", openDetailsFromHash);
window.addEventListener(
  "load",
  () => window.setTimeout(openDetailsFromHash, 0),
  { once: true },
);
openDetailsFromHash();
