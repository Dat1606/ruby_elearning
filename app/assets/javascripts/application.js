//= require jquery
//= require rails-ujs
//= require bootstrap.js
//= require jquery-ui
//= require_tree .

function add_fields(link, association, content) {
  var new_id = new Date().getTime();

  // find the new_ + "association" that was defined in Rails helper
  var regexp = new RegExp("new_" + association, "g");

  // find the container and append in the sub field content
  $(link).prev().append(content.replace(regexp, new_id));
  return false;
}

function removeField(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").fadeOut();
}

$(document).ready(function() {
  $(".check-box").change(function() {
    $(".check-box").prop('checked', false);
    $(this).prop('checked', true);
  });  
});
