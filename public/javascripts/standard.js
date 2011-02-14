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