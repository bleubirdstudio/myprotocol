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
//= require bootstrap.min
//= require_tree .

$('#myModal').on('shown.bs.modal', function () {
	$('#myInput').focus()
})

$(function() {                      
  $("#coach").click(function() {  
  	$('.active').removeClass('active');
    $(this).addClass("active");
    $('.coach').addClass('active');    
  })
  $("#gym").click(function() {  
  	$('.active').removeClass('active');
    $(this).addClass("active");    
    $('.gym').addClass('active');
  })
});
