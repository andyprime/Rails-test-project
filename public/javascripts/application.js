// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(document).ready(function() {
	$('#newbtn').bind('click', function() {
		clearForm();
		$('#hiddenbit').show(300);
	});
	
	$('#form_cancel').bind('click', cancelForm);
	
	$('#searchbox').bind('keyup', doSearch);
});

function cancelForm() {
	$('#hiddenbit').hide(300);
	clearForm();	
}

function clearForm() {
	$(':input','#new_contact')
	.not(':button, :submit, :reset, :hidden')
	.val('')
	.removeAttr('checked')
	.removeAttr('selected');
	
	$("#errorbox").html('');
}

function updateNotice(text) {
	$('#notice').show();
	$('#notice').html(text);
	setTimeout(clearNotice, 5000);
}

function clearNotice() {
	$('#notice').hide();
}

function doSearch() {
	var url = '/rails/contacts/search?filter=' + $('#searchbox').val();
	$.ajax({url: url});
}