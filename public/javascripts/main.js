$(document).ready(function(){
	cleanSearch();
	$('.menu-icon').click(function(event){
		event.preventDefault();
		$('.trigger').toggleClass('active');
	})
});