$(document).ready(function() {
    $(".container").on("click", ".login-button", function(event){
      event.preventDefault();
      var button = this;

      $.ajax({
        method: 'get',
        url: '/sessions/login'
      }).done(function(res){
        $(".login-append").append(res)
      })
    });

    $(".container").on("click", ".login-button-2", function(event){
      event.preventDefault();
      var $data = $(this).parent().serialize();
      // debugger;
      $.ajax({
        method: "post",
        url: '/sessions/login',
        data: $data
      }).done(function(res){
        // debugger
        $("nav").html(res);
        $(".login-append").hide();
      });
    });



  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
