$(window).load(function(){
  var findAreaForm = $("#find-areas")
  function addAreaHTML(area){
    var html = `<div class="find-area">
                  <p class="find-area-add" data-area-name=${area.name}>${area.name}</p>
                </div>`;
    findAreaForm.append(html);
  };
  $("#area_name").on("keyup", function(){
    var input = $("#area_name").val();
    var pref = $("#post_prefecture_id").val();
    var city = $("#post_city_id").val();
    if(input.length === 0){
      $("#find-areas").children().remove();
      return false;
    }else{
      $.ajax({
        url: "/areas/find_areas",
        type: "get",
        data: {
          name: input,
          city_id: city,
          prefecture_id: pref 
        },
        dataType: "json"
      })
      .done(function(areas){
        $("#find-areas").empty();
        if (areas.length !== 0){
          areas.forEach(function(area){
            addAreaHTML(area)
          });
        };
        $(".find-area-add").on("click", function(){
          var areaName = $(this).data("area-name");
          $("#find-areas").children().remove();
          $("#area_name").val(areaName);
        })
      })
      .fail(function(){
        alert("釣場検索に失敗しました")
      })
    }

  })
})