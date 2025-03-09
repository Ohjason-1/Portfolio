document.addEventListener("DOMContentLoaded", function () {
    console.log("JavaScript Loaded!");
    const navMenu = document.querySelector(".upper-right ul");
    const toggleButton = document.createElement("button");
    toggleButton.innerHTML = `<img src="Images/darkmode.png" alt="Dark Mode" class="toggle-icon">`;
    toggleButton.classList.add("dark-mode-toggle");
    navMenu.prepend(toggleButton);
    toggleButton.addEventListener("click", function () {
        document.body.classList.toggle("dark-mode");
        if (document.body.classList.contains("dark-mode")) {
            document.body.style.backgroundColor = "#222";
            document.body.style.color = "#eee";
        } else {
            document.body.style.backgroundColor = "black";
            document.body.style.color = "#ddd";
        }
    });
});