chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
    if (message.type === 'SET_COOKIE') {
        chrome.cookies.set({
            url: sender.tab.url,
            name: message.cookie.name,
            value: message.cookie.value,
            path: message.cookie.path,
            domain: message.cookie.domain,
            secure: message.cookie.secure,
            httpOnly: message.cookie.httpOnly,
            sameSite: message.cookie.sameSite,
            expirationDate: message.cookie.expirationDate
        });
    } 
    else if (message.type === 'CHECK_COOKIE') {
        chrome.cookies.get({
            url: sender.tab.url,
            name: message.name
        }, (cookie) => {
            sendResponse(cookie);
        });
        return true; // Required for async response
    }
});