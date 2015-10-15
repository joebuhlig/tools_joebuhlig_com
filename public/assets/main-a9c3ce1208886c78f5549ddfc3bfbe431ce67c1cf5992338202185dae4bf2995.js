$(document).ready(function(){
	menu_clickable();

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

$(document).on('page:change', function(event) {
	menu_clickable();
});

function menu_clickable() {
	$('.menu-icon').click(function(event){
		event.preventDefault();
		console.log('triggered');
		$('.trigger').toggleClass('active');
	});
}
