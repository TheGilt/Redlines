// USE AZURE TO FIND FAKE OR NOT
message = "";
if (true) {
    message = '<div class="redline-banner--fake"><div class="container"><div class="banner__title">Redlines Report</div><div class="banner__rating">FAKE</div></div></div>';
} else {
    message = '<div class="redline-banner--fake"><div class="banner__title">Redlines</div><div class="banner--rating">FAKE</div></div>';
}
$(`html`).prepend(message);