// USE AZURE TO FIND FAKE OR NOT
// If no entry do nothing

// Inject the payload.js script into the current tab after the popout has loaded
window.addEventListener('load', function(evt) {
    chrome.extension.getBackgroundPage().chrome.tabs.executeScript(null, {
        file: 'payload.js'
    });;
});

var res;
var upvotes;
var downvotes;
var title;
var wiki;

// Listen to messages from the payload.js script and write to popout.html
chrome.runtime.onMessage.addListener(function(message) {
    var url = message.url;
    $.ajax({
        url: 'http://localhost/article_info.php',
        type: "POST",
        dataType: 'json', // add json datatype to get json
        data: ({ urlLong: url }),
        success: function(data) {
            var res = jQuery.parseJSON(data);
            var upvotes = res[0];
            var downvotes = res[1];
            var title = res[2];
            var wiki = res[3];
            var message = "";
            if (upvotes > downvotes) { // true == fake
                message = '<div class="redline-banner--fake redline-banner"><div class="container">';
                message += '<div class="banner__title"><img class="banner__title__logo" src="https://i.imgur.com/8Ma1Fnb.png" alt="logo">';
                message += '<div class="banner__title__text">Redlines Report</div></div><div class="banner__rating">Our users marked this as fake</div></div></div>';
            } else {
                message = '<div class="redline-banner--true redline-banner"><div class="container">';
                message += '<div class="banner__title"><img class="banner__title__logo" src="https://i.imgur.com/8Ma1Fnb.png" alt="logo">';
                message += '<div class="banner__title__text">Redlines Report</div></div><div class="banner__rating">Our users marked this as fake</div></div></div>';
            }
            $(`html`).prepend(message);
            // inject ratio of upvotes to downvotes to banner to decide which 
            // html to display
        },
        error: function(e) {
            alert("error");
        }
    });
});