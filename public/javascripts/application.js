// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var openFbDialog = function()
{
    $( "#dialog" ).dialog({
        modal: true,
        buttons: {
            Ok: function() {
                window.location.href = 'gallery.html';
    	    }
    	}
    });
};
