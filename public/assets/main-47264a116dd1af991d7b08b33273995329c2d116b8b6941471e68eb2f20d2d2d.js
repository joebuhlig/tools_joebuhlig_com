$(document).ready(function(){
	console.log('loaded');
	$('.menu-icon').click(function(event){
		console.log('clicked');
		event.preventDefault();
		console.log('prevented');
		$('.trigger').toggleClass('active');
		console.log('toggled');
	})
});