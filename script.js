const toggle = document.querySelector(".nav-toggle");
const nav = document.querySelector(".primary-nav");
const navLinks = Array.from(document.querySelectorAll(".primary-nav a"));

if (toggle && nav) {
  toggle.addEventListener("click", () => {
    const isOpen = nav.classList.toggle("open");
    document.body.classList.toggle("nav-open", isOpen);
    toggle.setAttribute("aria-expanded", String(isOpen));
  });

  navLinks.forEach((link) => {
    link.addEventListener("click", () => {
      nav.classList.remove("open");
      document.body.classList.remove("nav-open");
      toggle.setAttribute("aria-expanded", "false");
    });
  });
}

const sections = navLinks
  .map((link) => document.querySelector(link.getAttribute("href")))
  .filter(Boolean);

const setActiveLink = () => {
  const current = sections.findLast((section) => section.getBoundingClientRect().top <= 120);
  navLinks.forEach((link) => {
    link.classList.toggle("active", current && link.getAttribute("href") === `#${current.id}`);
  });
};

window.addEventListener("scroll", setActiveLink, { passive: true });
window.addEventListener("load", setActiveLink);
