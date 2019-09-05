$(window).load(function(){
  function addAreaHtml(area){
    var html = `<div class="area-content">
                  <div class="post-content__item">
                  <a href="/areas/${area.id}">
                  <div class="find-area-name">
                  ${area.name}
                  </div>
                  <div class="area-content__info">
                    <div class="post-content__info__pref">
                      ${area.pref}
                    </div>
                    <div class="post__content__info__area">
                       ${area.city}
                    </div>
                  </div>
                </a>
              </div>
            </div>`
      return html;
  }
  var searchAreas = function(){
    var pref = $("#search_prefecture_id").val();
    var city = $("#search_city_id").val();
    var area = $("#find_area_name").val();
    $.ajax({
      url: "/areas/search_areas",
      type: "get",
      data: {
        prefecture_id: pref,
        city_id: city,
        area_name: area
      },
      dataType: "json"
    })
    .done(function(areas){
      $(".areas-container").children().remove();
      areas.forEach(function(area){
        $(".areas-container").hide()
        var html = addAreaHtml(area);
        $(".areas-container").append(html)
        $(".areas-container").fadeIn(200)
      })
    })
    .fail(function(){
      adderrHTML("検索に失敗しました")
    });
  }
  $(".search-areas").on("change",searchAreas);
});