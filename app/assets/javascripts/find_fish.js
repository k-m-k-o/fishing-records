$(window).load(function(){
  var searchHtml = $("#fish-search-result");
  var findFishHtml = $("#fish-find-result");
  function addHTML(fish){
    var html = `<div class="fish_search__right__add clearfix">
                  <p class="fish-search-add fish_search__right__add__name"data-fish-id=${fish.id} data-fish-name=${fish.name}>${fish.name}</p>
                </div>`;
    searchHtml.append(html);
  };

  function fishAddHTML(id,name){
    var html = `<div class='fish-find__right__add'>
                  <input name="post[fish_ids][]" value=${id} type="hidden" ></input>
                  <p class='fish-find__right__add__name fish-search-remove fish-search-add'>${name}</p>
                </div>`
    findFishHtml.append(html)
  };
  
  function adderrHTML(message){
    var html = `<div class="fish-search__right">
                  <p class="fish-search__right__name">${message}</p>
                </div>`
    return html;           
  };

  $("#fish-search-field").on("keyup", function(){
    var input = $("#fish-search-field").val();
    if(input.length === 0){
      $("#fish-search-result").children().remove();
      return false;
    }else{
    $.ajax({
      url: "/fish/search_fish",
      type: "GET",
      data: { keyword: input },
      dataType: "json"
    })
    .done(function(fishes){
      $("#fish-search-result").empty();
      if (fishes.length !== 0){
        fishes.forEach(function(fish){
          addHTML(fish);
        });
      }
      else{
        adderrHTML("一致する魚がいません");
      };
      $(".fish-search-add").on("click", function(){
        $(this).parent().remove();
        var fish_id = $(this).data("fish-id");
        var fish_name = $(this).data("fish-name");
        fishAddHTML(fish_id,fish_name);
      });
    })
    .fail(function(){
      alert("魚名検索に失敗しました")
    });
  };
  });
  $(document).on("click", ".fish-search-remove", function(){
    $(this).parent().remove();
  });
});