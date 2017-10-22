// Inject the payload.js script into the current tab after the popout has loaded
window.addEventListener('load', function (evt) {
	chrome.extension.getBackgroundPage().chrome.tabs.executeScript(null, {
		file: 'payload.js'
	});;
});

// Listen to messages from the payload.js script and write to popout.html
chrome.runtime.onMessage.addListener(function (message) {
	var url = message.url;
	$.ajax({
		url: 'http://localhost/article_info.php',
	    type: "POST",
	    dataType:'json', // add json datatype to get json
	    data: ({urlLong: url}), 
	    success: function(data) {
	        var res = jQuery.parseJSON(data);
	        var upvotes = res[0];
	        var downvotes = res[1];
	        var title = res[2];
	        var wiki = res[3];
	        // inject ratio of upvotes to downvotes to banner to decide which 
	        // html to display
	    },
	    error: function(e) {
	        alert("error");
	    }
	});
});