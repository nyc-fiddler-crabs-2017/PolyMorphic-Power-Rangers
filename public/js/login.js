$(document).ready(function() {
    $(".container").on("click", ".login-button", function(event){
      event.preventDefault();
      var button = this;
      $(".register-append").children().hide();

      $.ajax({
        method: 'get',
        url: '/sessions/login'
      }).done(function(res){
        if($(".login-form").is(":visible")){
          $(".login-form").hide();
        }
        $(".login-append").append(res)
      })
    });

    $(".container").on("click", ".register-button", function(event){
      event.preventDefault();
      var button = this;
      $(".login-append").children().hide();
      $.ajax({
        method: 'get',
        url: '/users/new'
      }).done(function(res){
        if($(".register-form").is(":visible")){
          $(".register-form").hide();
        }
        $(".register-append").append(res)
      })
    });



    $(".container").on("click", ".login-form-submit", function(event){
      event.preventDefault();
      var $data = $(this).parent().serialize();
      // debugger;
      $.ajax({
        method: "post",
        url: '/sessions/login',
        data: $data
      }).done(function(res){
        if(res.includes("wrong")){
          $(".errors").append(res);
        }
        $("nav").html(res);
        $(".login-form").hide();
        
      });
    });

    $(".container").on("click", ".register-form-submit", function(event){
      event.preventDefault();
      var $data = $(this).parent().serialize();
      // debugger;
      $.ajax({
        method: "post",
        url: '/users',
        data: $data
      }).done(function(res){
        if(res.includes("wrong")){
          $(".errors").append(res);
        }
        $("nav").html(res);
        $(".register-form").hide();
        
      });
    });




  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
