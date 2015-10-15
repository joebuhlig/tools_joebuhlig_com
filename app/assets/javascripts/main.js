$(document).ready(function(){
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
});