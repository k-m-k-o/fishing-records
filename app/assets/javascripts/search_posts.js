$(function(){
  $("#search_prefecture_id").on("change",function(){
    $.ajax({
      type: "get",
      url: "/posts/cities_search",
      data: {
        prefecture_id: $(this).val()
      }
    })
    .done(function(data){
      $('#search_city_id').html(data);
    });
  });
  
});