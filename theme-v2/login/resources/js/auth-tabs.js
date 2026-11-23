document.addEventListener("DOMContentLoaded", () => {
  const page = document.body.dataset.pageId;

  if (!["login-login", "login-register"].includes(page)) {
    return;
  }

  const header = document.querySelector("#kc-header");
  if (!header || document.querySelector("#europeana-auth-tabs")) {
    return;
  }

  // Reuse Keycloak's existing, session-specific navigation URL.
  const linkText = page === "login-login" ? "Join" : "Back to Login";

  const existingLink = [...document.querySelectorAll("a")]
  .find(a => a.textContent.trim().endsWith(linkText) && a.href);

  if (!existingLink) {
    console.warn("Europeana auth tabs: navigation link not found");
    return;
  }

  const loginActive = page === "login-login";

  const tabs = document.createElement("nav");
  tabs.id = "europeana-auth-tabs";
  tabs.setAttribute("aria-label", "Account access");

  function createTab(label, active) {
    const tab = document.createElement("a");
    tab.textContent = label;
    tab.className = "europeana-auth-tab";

    if (active) {
      tab.classList.add("active");
      tab.setAttribute("aria-current", "page");
    } else {
      tab.href = existingLink.href;
    }

    return tab;
  }

  tabs.append(
    createTab("Log in", loginActive),
    createTab("Join", !loginActive)
  );

  header.appendChild(tabs);
});
