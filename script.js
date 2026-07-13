const siteHeader = document.querySelector(".site-header");
const navToggle = document.querySelector(".nav-toggle");
const primaryNav = document.querySelector(".primary-nav");
const managedMenu = document.querySelector(".managed-menu");
const menuToggle = document.querySelector(".menu-toggle");
const desktopNavigation = window.matchMedia("(min-width: 961px)");

const setManagedMenu = (open) => {
  if (!managedMenu || !menuToggle) return;
  managedMenu.classList.toggle("open", open);
  menuToggle.setAttribute("aria-expanded", String(open));
};

const setPrimaryNav = (open) => {
  if (!primaryNav || !navToggle) return;
  primaryNav.classList.toggle("open", open);
  document.body.classList.toggle("nav-open", open && !desktopNavigation.matches);
  navToggle.setAttribute("aria-expanded", String(open));
  navToggle.setAttribute("aria-label", open ? "Close navigation" : "Open navigation");
  if (!open) setManagedMenu(false);
};

navToggle?.addEventListener("click", () => {
  setPrimaryNav(!primaryNav.classList.contains("open"));
});

menuToggle?.addEventListener("click", (event) => {
  event.stopPropagation();
  setManagedMenu(!managedMenu.classList.contains("open"));
});

managedMenu?.addEventListener("mouseenter", () => {
  if (desktopNavigation.matches) setManagedMenu(true);
});

managedMenu?.addEventListener("mouseleave", () => {
  if (desktopNavigation.matches && !managedMenu.contains(document.activeElement)) {
    setManagedMenu(false);
  }
});

managedMenu?.addEventListener("focusout", (event) => {
  if (desktopNavigation.matches && !managedMenu.contains(event.relatedTarget)) {
    setManagedMenu(false);
  }
});

primaryNav?.querySelectorAll("a").forEach((link) => {
  link.addEventListener("click", () => {
    setManagedMenu(false);
    if (!desktopNavigation.matches) setPrimaryNav(false);
  });
});

document.addEventListener("click", (event) => {
  if (managedMenu && !managedMenu.contains(event.target)) setManagedMenu(false);
  if (!desktopNavigation.matches && siteHeader && !siteHeader.contains(event.target)) {
    setPrimaryNav(false);
  }
});

document.addEventListener("keydown", (event) => {
  if (event.key !== "Escape") return;

  if (managedMenu?.classList.contains("open")) {
    setManagedMenu(false);
    menuToggle?.focus();
    return;
  }

  if (primaryNav?.classList.contains("open")) {
    setPrimaryNav(false);
    navToggle?.focus();
  }
});

desktopNavigation.addEventListener("change", () => {
  setManagedMenu(false);
  setPrimaryNav(false);
});

const faqButtons = Array.from(document.querySelectorAll(".faq-question"));

const setFaqState = (button, open) => {
  const answerId = button.getAttribute("aria-controls");
  const answer = answerId ? document.getElementById(answerId) : null;
  if (!answer) return;

  button.setAttribute("aria-expanded", String(open));
  answer.hidden = !open;
};

faqButtons.forEach((button) => {
  button.addEventListener("click", () => {
    setFaqState(button, button.getAttribute("aria-expanded") !== "true");
  });
});

const openFaqFromHash = () => {
  const id = window.location.hash.slice(1);
  if (!id) return;

  const item = document.getElementById(id);
  const button = item?.querySelector(".faq-question");
  if (!button) return;

  setFaqState(button, true);
  window.requestAnimationFrame(() => item.scrollIntoView({ block: "start" }));
};

window.addEventListener("hashchange", openFaqFromHash);
openFaqFromHash();
