
$(function(){
  function buildHTML(comment){
    var html = `<p class="comment">
                   <strong>
                    <a href=/users/${comment.id}>${comment.user}</a>
                    </strong>
                    ${comment.text}
                 </p>`
    return html;
  }
  $(".new-comment").on('submit', function(e){
    e.preventDefault();
    $(".comment-submit").removeAttr('data-disable-with');
    $("input:submit").prop("disabled", true);
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "post",
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('#area-show__comment__container').prepend(html);
      $('.comment-textbox').val('');
      $(".comment-submit").attr('data-disable-with');
      $("input:submit").prop("disabled", false);
    })
    .fail(function(){
      alert('投稿できません');
    })
  })
});

