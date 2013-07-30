$(document).ready(function() {
  $('#create_tweet').on('submit', function(event){
    event.preventDefault();
    $('.success').remove();
    $('#loading').show();
    var data = $(this).serialize();
    $.post('/create_tweet', data, function(response){
      $('#loading').hide();
      $(response).appendTo('.create');
    });
  });
});
