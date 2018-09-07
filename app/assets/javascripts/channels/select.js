$(document).ready(function(){
  $('#select-words, #select-lessons').change(function() {
    var vocabularies = $('#select-words').val()
    var lessons = $('#select-lessons').val()
    $.ajax({
      url: '/vocabularies',
      method: 'GET',
      data: {
        vocabularies: vocabularies,
        lessons: lessons
      }
    })
  });
});
