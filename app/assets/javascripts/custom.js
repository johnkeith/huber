$(function(){
  // index functions for form listeners
  $("#github-username").focusout(function(){
    var username = $("#github-username").val();
    $.ajax({
      type: "GET", 
      url: "https://api.github.com/users/" + username, 
      success: function(d) {
        $("#github-avatar").attr("src", d.avatar_url);
        $("#github-username-group").addClass("has-success");
        $("#github-username-group").removeClass("has-error");
        $(".form-errors").text("");

      },
      error: function() {
        $(".form-errors").text("Sorry, that is not a Github username.");
        $("#github-avatar").attr("src", "");
        $("#github-username-group").addClass("has-error");
        $("#github-username-group").removeClass("has-success");
      }
    });
  });
  $("#gender-select").focusout(function(){
    $("#gender-group").addClass("has-success");
  });
  $("#match-pref-select").focusout(function(){
    $("#match-group").addClass("has-success");
  });
});
