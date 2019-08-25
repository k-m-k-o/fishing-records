
$(function(){
  $("#post_prefecture_id").on("change",function(){
    $.ajax({
      type: "get",
      url: "/posts/cities_select",
      data: {
        prefecture_id: $(this).val()
      }
    })
    .done(function(data){
      $('#post_city_id').html(data)
    });
  });
  
});
