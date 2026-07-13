const toggle = document.querySelector(".nav-toggle");
const nav = document.querySelector(".primary-nav");
const navLinks = Array.from(document.querySelectorAll(".primary-nav a"));
const menuToggle = document.querySelector(".menu-toggle");
const managedMenu = document.querySelector(".managed-menu");

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
      managedMenu?.classList.remove("open");
      menuToggle?.setAttribute("aria-expanded", "false");
    });
  });
}

if (menuToggle && managedMenu) {
  menuToggle.addEventListener("click", (event) => {
    event.stopPropagation();
    const isOpen = managedMenu.classList.toggle("open");
    menuToggle.setAttribute("aria-expanded", String(isOpen));
  });

  document.addEventListener("click", (event) => {
    if (!managedMenu.contains(event.target)) {
      managedMenu.classList.remove("open");
      menuToggle.setAttribute("aria-expanded", "false");
    }
  });

  document.addEventListener("keydown", (event) => {
    if (event.key === "Escape") {
      managedMenu.classList.remove("open");
      menuToggle.setAttribute("aria-expanded", "false");
    }
  });
}

const topicFilters = Array.from(document.querySelectorAll("[data-topic-filter]"));
const insightCards = Array.from(document.querySelectorAll("[data-topic]"));

topicFilters.forEach((filter) => {
  filter.addEventListener("click", () => {
    const topic = filter.dataset.topicFilter;
    topicFilters.forEach((item) => item.classList.toggle("active", item === filter));
    insightCards.forEach((card) => {
      const visible = topic === "all" || card.dataset.topic === topic;
      card.hidden = !visible;
    });
  });
});

const sections = navLinks
  .map((link) => {
    const href = link.getAttribute("href");
    return href && href.startsWith("#") ? document.querySelector(href) : null;
  })
  .filter(Boolean);

const setActiveLink = () => {
  const current = sections.findLast((section) => section.getBoundingClientRect().top <= 120);
  navLinks.forEach((link) => {
    link.classList.toggle("active", current && link.getAttribute("href") === `#${current.id}`);
  });
};

window.addEventListener("scroll", setActiveLink, { passive: true });
window.addEventListener("load", setActiveLink);
