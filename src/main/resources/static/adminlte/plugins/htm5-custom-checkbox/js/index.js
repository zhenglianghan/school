/*
	Custom checkbox and radio button - Jun 18, 2013
	(c) 2013 @ElmahdiMahmoud 
	license: http://www.opensource.org/licenses/mit-license.php
*/   
$('input[name="radio-btn"]').wrap('<div class="radio-btn"><i></i></div>');
$(".radio-btn").on('click', function () {
    var _this = $(this),
        block = _this.parent().parent();
    block.find('input:radio').attr('checked', false);
    block.find(".radio-btn").removeClass('checkedRadio');
    _this.addClass('checkedRadio');
    _this.find('input:radio').attr('checked', true);
});
$('input[class="custom_checkbox"]').wrap('<div class="check-box"><i></i></div>');
$.fn.toggleCheckbox = function () {
    this.attr('checked', !this.attr('checked'));
}
$('.check-box').on('click', function () {	
    $(this).find(':checkbox').toggleCheckbox();
    $(this).toggleClass('checkedBox');
    
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
