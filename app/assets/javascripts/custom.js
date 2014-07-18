function checkFormCompletion() {
  var username = $("#github-username").val();
  var gender = $("#gender-select").val();
  var match = $("#match-pref-select").val();
  if (username !== "" && gender !== null && match !== null) {
    
  }
}

function postGuestInformation(username, gender, match) {
  var submitted = { username: username, gender: gender, match: match }
  $.ajax({
    url: "/rails/action", 
    type: "POST",
    data: submitted
  })
    .done(function(message){

    });
}

$(function(){
  // index functions for form listeners
  $("#github-username, #gender-select, #match-pref-select").each(function(){
    $(this).change(function(){
      console.log("I'm about to check!")
      checkFormCompletion();
    }); 
  })

  $("#github-username").change(function(){
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
  $("#gender-select").change(function(){
    $("#gender-group").addClass("has-success");
  });
  $("#match-pref-select").change(function(){
    $("#match-group").addClass("has-success");
  });
});
