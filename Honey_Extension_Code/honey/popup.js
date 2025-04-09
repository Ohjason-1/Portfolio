document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('helpButton').addEventListener('click', async() => {
        const [tab] = await chrome.tabs.query({active: true, currentWindow: true});
        if (!tab.url.includes('newegg.com')) {
            return;
        }
            
        const url = new URL(tab.url);
        if (url.searchParams.has('utm_source')) {
            url.searchParams.set('utm_source', 'howl_paypal_honey');
            chrome.tabs.update(tab.id, {url: url.toString()});
        }

        chrome.cookies.get({
            url: tab.url,
            name: 'NV_MC_LC'
        }, (cookie) => {
            if (cookie) {
                chrome.cookies.set({
                    url: tab.url,
                    name: 'NV_MC_LC',
                    value: 'afc-howl-paypal-honey',
                    path: cookie.path,
                    domain: cookie.domain,
                    secure: cookie.secure,
                    httpOnly: cookie.httpOnly,
                    sameSite: cookie.sameSite,
                    expirationDate: cookie.expirationDate
                });
            }
        });
        document.getElementById('initialView').style.display = 'none';
        document.getElementById('successView').style.display = 'block';
        setTimeout(() => {
            window.close();
        }, 2000)
    });
});