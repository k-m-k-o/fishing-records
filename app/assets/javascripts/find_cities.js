
$(function(){
  $("#post_prefecture_id").on("change",function(){
    console.log("a")
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
  
});
