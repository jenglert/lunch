// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

if (typeof luncd == 'undefined') {
	lunchd = {}
}

if (typeof lunchd.event == 'undefined') {
	lunchd.event = {}
}

lunchd.event.voteUp = function(lunch_option_id, user_id) {
	$.ajax('/event/vote?lunch_option_id=' + lunch_option_id + '&user_id=' + user_id + '&value=1', {
		error: function error(jqXHR, textStatus, errorThrown) {
			alert('errors');
		},
		dataType: 'script'
	});
}

lunchd.event.voteDown = function(lunch_option_id, user_id) {
	$.ajax('/event/vote?lunch_option_id=' + lunch_option_id + '&user_id=' + user_id + '&value=-1', {
		error: function error(jqXHR, textStatus, errorThrown) {
			alert('error');
		},
		dataType: 'script'
	});
}

$(document).ready(function() {$("input[type=submit]").hover(goLite, goDim)} );

function goDim()
{
   $(this).css("color", "#8F0700");
   $(this).css("backgroundColor", "#CE8683");
   $(this).css("borderStyle", "#inset");
   $(this).css("borderColor", "#670500");

}

function goLite()
{
	return;  // Disabled the hover effect temporarily.
   $(this).css("color", "#BC4A44");
   $(this).css("backgroundColor", "#BC4A44");
   $(this).css("borderStyle", "#outset");
   $(this).css("borderColor", "#670500");
}