$(document).on('page:change', function(event) {
	$('.menu-icon').click(function(event){
		event.preventDefault();
		$('.trigger').toggleClass('active');
	});

	var topOfContent = $(".page-content").offset().top;

	$(window).scroll(function() {
	    var topOfWindow = $(window).scrollTop() + $('.site-nav-outer').height();
	    if (topOfContent < topOfWindow) {
	        $(".site-nav-outer").addClass("scrolled");          
	    }
	    else {
	        $(".site-nav-outer").removeClass("scrolled");
	    }
	});

	$('.notice, .alert').slideDown().delay('3000').slideUp();

	$('#checkout-discount').keyup(function(){
		discountStatus = validate_discount($('#checkout-discount').val(), initialPrice);
	});

});

function validate_discount(code, initialPrice){
	$.ajax({
		type:"GET",
		data: {price: initialPrice},
		url:"discounts/" + code,
		success:function(result){
			console.log(result);
			$('#discount-result').html(result.result);
			$('.price').html(result.new_price);
			if (result.result_code == 200){
				$('#discount-result').removeClass('error');
			}
			else if (result.result_code == 100){
				$('#discount-result').addClass('error');
			}
		}
	})
}