
$(window).load(function(){
  $("#post_prefecture_id").on("change",function(){
    $.ajax({
      type: "get",
      url: "/posts/cities_select",
      data: {
        prefecture_id: $(this).val()
      }
    })
    .done(function(data){
      $(".search_cities").html(data)
      $("#post_city_id").formSelect();
    })
  
  });
  $("#area_prefecture_id").on("change",function(){
    $.ajax({
      type: "get",
      url: "/areas/area_cities",
      data: {
        prefecture_id: $(this).val()
      }
    })
    .done(function(data){
      $(".search_cities").html(data)
      $("#area_city_id").formSelect();
    })
  
  });
});
