// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

if (typeof luncd == 'undefined') {
	lunchd = {}
}

if (typeof lunchd.event == 'undefined') {
	lunchd.event = {}
}

lunchd.event.voteUp = function(lunch_option_id, user_id) {
	$('#voting' + lunch_option_id).remove();
	$.ajax('/event/vote?lunch_option_id=' + lunch_option_id + '&user_id=' + user_id + '&value=1', {
		error: function error(jqXHR, textStatus, errorThrown) {
			alert('errors');
		},
		dataType: 'script'
	});
}

lunchd.event.voteDown = function(lunch_option_id, user_id) {
	$('#voting' + lunch_option_id).remove();
	$.ajax('/event/vote?lunch_option_id=' + lunch_option_id + '&user_id=' + user_id + '&value=-1', {
		error: function error(jqXHR, textStatus, errorThrown) {
			alert('error');
		},
		dataType: 'script'
	});	
}