// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//=require jquery 
//=require rails-ujs 
//= require materialize
//=require_tree .

$(document).ready(function(){
  $('select').formSelect();
  $('.collapsible').collapsible();
  $(".user-menu").on("click",function(){
    $(".describe-container").animate({scrollTop: $('.user').offset().top});
  })
  $(".fish-menu").on("click",function(){
    $(".describe-container").animate({scrollTop: $('.fish-post').offset().top});
  })
  $(".area-menu").on("click",function(){
    $(".describe-container").animate({scrollTop: $('.area-post').offset().top});
  })
  $(".search-menu").on("click",function(){
    $(".describe-container").animate({scrollTop: $('.search').offset().top});
  })
  $(".info-menu").on("click",function(){
    $(".describe-container").animate({scrollTop: $('.infomation_s').offset().top});
  })
  $(".scroll_icon").on("click",function(){
    $(".describe-container").animate({scrollTop: $('.app-content').offset().top})
  })
});
