$(document).ready(function(){
	$('.confirm_register').click(function(){
	    return confirm("confirm register?")
	    
	});
	$('.confirm_delete').click(function(){
	    return confirm("confirm delete?")
	});
	$('.confirm').click(function(){
	    return confirm("confirm?")
	});
	$(function () {
    	$('#teacher_marktable').DataTable();
    	$('#teacher_testtable').DataTable();
    	$('#teacher_coursestable').DataTable();
    	$('#teacher_questiontable').DataTable();
    	$('#teacher_achievementtable').DataTable();
    	$('#teacher_filetable').DataTable();
    	$('#student_coursestable').DataTable();
    	$('#student_testtable').DataTable();
    	$('#student_achievementtable').DataTable();
    	$('#student_filetable').DataTable();
        $('#course_table').DataTable();
  	});
	$('.input_score').keyup(function get_sum(){
		var sum=0;
		for(var i=0;i<$('.input_score').length;i++){
			if($('.custom_checkbox').eq(i).prop('checked'))
				sum += parseFloat($('.input_score').eq(i).val());
		}
		$('#test_scoresum').text(sum);
		if(sum>100||sum<0)
			$('#test_scoresum').css("color","red");
		else if(sum==100)
			$('#test_scoresum').css("color","green");
		else
			$('#test_scoresum').css("color","black");
	});	
	
	$('#exam_percent').keyup(function(){
		var proportion=$('#exam_percent').val();
		if(proportion>100||proportion<0)
			$('#exam_percent').css("color","red");
		else
			$('#exam_percent').css("color","black");
		var sum_proportion = parseFloat(proportion)+parseFloat($("#existing_proportion").text());
		$("#sum_proportion").text(sum_proportion);
		if(sum_proportion>100||sum_proportion<0)
			$("#sum_proportion").css("color","red");
		else
			$("#sum_proportion").css("color","black");
	});
	
	$('#test_add_submit').click(function(){
		if($("#test_scoresum").text()!=100){
			alert("Sum should equal 100");
			return false;
		}
		if($("#sum_proportion").text()>100){
			alert("Sum of all test`s proportion should less than or equal 100%!");
			return false;
		}
		for(var i=0;i<$('.get_date').length;i++){
			var mydate = new Date();			
			$('.get_date').eq(i).val(mydate.toLocaleDateString());
		}
	});
	$('.get_score').keyup(function(){
		// for(var i=0;i<$('.sub_div').length;i++){
		// 	var get = parseFloat($('.sub_div').eq(i).find('.get_score').val());
		// 	var ques= parseFloat($('.sub_div').eq(i).find('.question_score').text());
		// 	if(get>ques||get<0){
         //        $('.sub_div').eq(i).find('.get_score').css("color","red");
		// 	}
		// 	else{
         //        $('.sub_div').eq(i).find('.get_score').css("color","black");
		// 	}
        //
		// }

		var get = parseFloat($(this).val());
		var ques = parseFloat($(this).parents('.sub_div').find('.question_score').text());
        if(get>ques||get<0){
			$(this).css("color","red");
		}
		else{
            $(this).css("color","black");
		}

	});	
	$('#mark_submit').click(function(){
		for(var i=0;i<$('.get_score').length;i++){
			if($('.get_score').eq(i).css("color") == "red"){
				alert("check score!");
				return false;
			}							
		}


		for(var i=0;i<$('.get_date').length;i++){
			var mydate = new Date();			
			$('.get_date').eq(i).val(mydate.toLocaleDateString());
		}
	});
	
	$('#file_submit').click(function(){
		for(var i=0;i<$('.get_date').length;i++){
			var mydate = new Date();			
			$('.get_date').eq(i).val(mydate.toLocaleDateString());
		}
	});
	$('.focu-gray').mouseover(function(){
		$(this).css("background-color","#e7e7e7");
	});
	$('.focu-gray').mouseout(function(){
		if(!$(this).hasClass("bg-gray-light2"))
			$(this).css("background-color","#f9f9f9");
	});
});

