$(function(){
  $("#github-username").focusout(function(){
    var username = $("#github-username").val();
    $.ajax({
      type: "GET", 
      url: "https://api.github.com/users/" + username, 
      success: function(d) {
        console.log(d);
        $("#github-avatar").attr("src", d.avatar_url);
      }
    });
  });
});
