function addGroupRow() {
	var group_str = '\
					<div class="panel panel-default">\
						    <div class="panel-heading" role="tab" id="heading' + num_groups + '">\
						      <h4 class="panel-title">\
						        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse' + num_groups + '" aria-expanded="true" aria-controls="collapse' + num_groups + '">\
						          Plate Options\
						        </a>\
						      </h4>\
						    </div>\
						    <div id="collapse' + num_groups + '" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading' + num_groups + '">\
						      <div class="panel-body">\
						      	<div class="form-inline">\
									<input type="hidden" name="menu_group_num[]" value="'+num_groups+'"/>\
									<b>Name*</b>\
									<input data-req="1" name="group_name_' + num_groups + '" class="string optional form-control" type="text"/>\
									<b>Price*</b>\
									<input data-req="1" name="additional_price_' + num_groups + '" class="string optional form-control" type="text"/>\
									<b>Maximum Allowed*</b>\
									<input data-req="1" name="max_allowed_' + num_groups + '" class="string optional form-control" type="text"/>\
								</div>\
								<br/>\
								<b>Menu Item Content</b>\
								<input data-req="1" name="menuitemcontent' + num_groups + '[]" placeholder="Name" type="text" class="string optional form-control"/>\
								<span id="add-new-row' + num_groups + '"></span>\
								<br/>\
								<a class="btn" onclick="addContentRow(' + num_groups + ')">+ Add Choice</a>\
						      </div>\
						    </div>\
					  </div>';
	$("#add-new-option").append(group_str);
	num_groups++;
}

function addContentRow(group_num) {
	$("#add-new-row" + group_num).append('<br/><input placeholder="Name" name="menuitemcontent' + group_num + '[]" type="text" class="string optional form-control"/>');
}

$(document).ready(function(){
	$('.collapse').collapse();
});	

$("#build_your_own").click(function() {
	$("#build_your_own_content").toggle();
	
});
