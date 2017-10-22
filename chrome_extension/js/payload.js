// send JSON object
chrome.runtime.sendMessage({url : document.URL, title : document.title});