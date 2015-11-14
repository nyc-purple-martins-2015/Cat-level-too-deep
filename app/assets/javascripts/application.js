//= require jquery
//= require jquery_ujs

$(document).ready(function () {

    $(".comment_button_toggle").click(function () {
      selected_comment = $(this)
      $(selected_comment.parents(".comments_section").children(".comments_form")).toggle();
    });

    $(".comments_form h4 form").submit(function () {
      selected_comment = $(this)
      $(selected_comment.parents(".comments_section").children(".comments_form")).toggle();
    });

});
