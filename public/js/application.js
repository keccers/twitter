function showLoading() {
  $( '.success' ).remove();
  $( '#loading' ).show();
}

function timeout(jid) {
  console.log('/status/' + jid)
  $.get( '/status/' + jid, function(response) {
    console.log(response);
    if ( response.status === true ) {
      finished(); 
    }
    else setTimeout( function(){
      timeout(jid);
    }, 3000)
  });
}

function finished() {
  $.get('/tweet', function(response) {
    $('#loading').hide();
    $( '.success' ).remove();
    $(response).appendTo('.content');
  });
}

$(document).ready( function() {
  $('#create_tweet').on('submit', function(event){
    event.preventDefault();
    showLoading();
    var data = $(this).serialize();
    $.post('/tweet/create', data, function(response){
      timeout(response);
    });
  });
});
