// USE AZURE TO FIND FAKE OR NOT
// If no entry do nothing
message = "";
if (true) {
    message = '<div class="redline-banner--fake"><div class="container">';
    message += '<div class="banner__title"><img class="banner__title__logo" src="https://i.imgur.com/8Ma1Fnb.png" alt="logo">';
    message += '<div class="banner__title__text">Redlines Report</div></div><div class="banner__rating">Our users marked this as fake</div></div></div>';
} else {
    message = '<div class="redline-banner--fake"><div class="banner__title">Redlines</div><div class="banner--rating">FAKE</div></div>';
}
$(`html`).prepend(message);