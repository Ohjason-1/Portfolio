async function checkCurrentState() {
    const url = new URL(window.location.href);
    const hasUtmSource = url.searchParams.get('utm_source') === 'howl_paypal_honey';

    // Check cookie via background script
    const cookieStatus = await chrome.runtime.sendMessage({
        type: "CHECK_COOKIE",
        name: "NV_MC_LC"
    });

    return hasUtmSource && cookieStatus.value === 'afc-howl-paypal-honey';
}

async function modifyNeweggParameters() {
    const url = new URL(window.location.href);
    if (url.searchParams.has('utm_source')) {
        url.searchParams.set('utm_source', 'howl_paypal_honey');
        window.location.href = url.toString();
    }

    await chrome.runtime.sendMessage({
        type: "SET_COOKIE",
        cookie: {
            name: "NV_MC_LC",
            value: "afc-howl-paypal-honey"
        }
    });
}

async function createPopup() {
    const isAlreadyModified = await checkCurrentState();
    const popup = document.createElement('div');
    popup.className = 'custom-popup';
    const closeButton = document.createElement('button');
    closeButton.className = 'close-button';
    closeButton.innerHTML = '*';
    closeButton.addEventListener('click', () => popup.remove());

    const text = document.createElement('div');
    text.className = 'popup-text';
    if (isAlreadyModified) {
        text.textContent = "All done, lowest price is found :)";
        popup.appendChild(text);
        setTimeout(() => popup.remove(), 3000);
    } else {
        text.textContent = 'Want me to help with your shopping?';

        const button = document.createElement('button');
        button.textContent = 'Help me';
        button.addEventListener('click', async () => {
            await modifyNeweggParameters();
            text.textContent = 'All good!';
            button.style.display = 'none';
            closeButton.style.display = 'none';
            setTimeout(() => {
                popup.remove();
            }, 2000);
        });
        popup.appendChild(text);
        popup.appendChild(button);
    }


    popup.appendChild(closeButton);
    document.body.appendChild(popup);
}

createPopup();