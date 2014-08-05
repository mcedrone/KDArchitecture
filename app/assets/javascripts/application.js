// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var ready = function(){
	//slideshow
	$("#slideshow > li:gt(0)").hide();
	setInterval(function() {
		$('#slideshow > li:first')
		.fadeOut(800)
		.next()
		.fadeIn(800)
		.end()
		.appendTo('#slideshow');
	}, 5000);

	$('.dashboard_top').on('click', '#add_background', function(e){
		e.preventDefault();
		$('.new_background_wrapper').show();
	});
	
	$('.new_background_wrapper').on('click', '#close_add_background', function(e){
		e.preventDefault();
		$('.new_background_wrapper').hide();
	});

		$('#photos_scroll').on('click', '.property_image', function(e){
		var image = $(this).html();
		$('#current_photo_viewer').fadeOut(300, function(){
			$('.current_image').html(image).find('img').css('height', '650px');
		}).fadeIn(300);
	});

	//prev image
	$('.image_container').on('click', '.prev_image', function(){
		var image_id = $('.current_image').find('img').data('id');
		var prev_image = $('#photos_scroll').find('img[data-id="' + image_id + '"]').parents('.property_image').prev().html();
		if(!prev_image){
			prev_image = $('#photos_scroll').find('img').last().parents('.property_image').html();
		}
		$('#current_photo_viewer').fadeOut(300, function(){
			$('.current_image').html(prev_image).find('img').css('height', '650px');
		}).fadeIn(300);
	});

	//next image
	$('.image_container').on('click', '.next_image', function(){
		var image_id = $('.current_image').find('img').data('id');
		var next_image = $('#photos_scroll').find('img[data-id="' + image_id + '"]').parents('.property_image').next().html();
		if(!next_image){
			next_image = $('#photos_scroll').find('img').first().parents('.property_image').html();
		}
		$('#current_photo_viewer').fadeOut(300, function(){
			$('.current_image').html(next_image).find('img').css('height', '650px');
		}).fadeIn(300);
	});
	
	//show list in edit views
	$('.dashboard_top').on('click', '.list_view_icon', function(){
		$('.full_view_div').slideUp(700);
	});
	//show icons in edit views
	$('.dashboard_top').on('click', '.images_view_icon', function(){
		$('.full_view_div').slideDown(700);
	});

	//fades in all pages to avoid Flash of Unstyled Content (FOUC)
	$('.main_container').fadeIn(500);
};
$(document).ready(ready);
$(document).on('page:load', ready);
