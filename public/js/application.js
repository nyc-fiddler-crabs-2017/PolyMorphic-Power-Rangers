$(document).ready(function() {
  $(".container").on("click", ".answer-on-post", function(event){
    event.preventDefault();
    var url = $(this).closest("form").attr("action")
    $(".answer-form-here").children().hide();
    $(".comment-form-here").children().hide();

    $.ajax({
      method: "get",
      url: url
    }).done(function(res){
      $(".answer-form-here").append(res)
    })
  })



  $(".container").on("click", ".comment-on-post", function(event){
    event.preventDefault();
    var url = $(this).closest("form").attr("action")
    $(".answer-form-here").children().hide();
    $(".comment-form-here").children().hide();

    $.ajax({
      method: "get",
      url: url
    }).done(function(res){
      $(".comment-form-here").append(res)
    })
  })



  $(".container").on("click", ".comment-on-answer", function(event){
    event.preventDefault();
  
      var url = $(this).closest("form").attr("action")
      var button = $(this).parent();
      $(".answer-form-here").children().hide();
      $(".comment-form-here").children().hide();
      $(".comment-form-here-2").children().hide();
    
    $.ajax({
      method: "get",
      url: url
    }).done(function(res){
      button.parent().find(".comment-form-here-2").append(res);
    })
  })

  $(".container").on("click", ".new-question-button", function(event){
    event.preventDefault();
    $(".new-question-button").hide();

    $.ajax({
      method: "get",
      url: 'posts/new'
    }).done(function(res){
      
      console.log(res)
      $(".new-question-container").append(res)
    })


  });


});
