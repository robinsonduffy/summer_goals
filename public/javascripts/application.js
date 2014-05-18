$(document).ready(function(){
	$("ul#tasks li.disabled").dblclick(function(){
		task_id = $(this).children("input").eq(0).val();
		window.location.href = window.location.href + "/delete/" + task_id;
	});
});