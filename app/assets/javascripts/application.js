// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require bootstrap_sb_admin_base_v2
//= require_tree .


function validateFormInputs(ele_id) {
	var fm_valid = true;
	$("#" + ele_id + " input[type=text], textarea, input[type=number]").each(function (){
		if ($(this).is(":visible") &&  $(this).data("req") == "1" && $(this).val().length == 0) {

			$(this).css({
				border: "solid 1px red"
			});
			fm_valid = false;
		} else {
			$(this).css({
				border: ""
			})
		}		
	});
	return fm_valid;
}
