//= require jquery
//= require jquery_ujs
//= require_tree .
function spin() {
  $('#button').click(function() {
    $('.main p').fadeOut(1000);
    $(this).hide();
    $('.fa-spinner').show();
  })
}

function lockSearch() {
  var headerHeight = $('.header').outerHeight( true );
  if($(window).scrollTop() > headerHeight ){
    if($('.side').css('position') == 'absolute'){
      $('.side').css({'position' : 'fixed', 'margin-top' : '0', 'top' : '5vh'});
      $('.side p').css({'margin-top': '0'});
    };
  }else{
    if($('.side').css('position') == 'fixed'){
      $('.side').css({ 'position' : 'absolute', 'top' : '', 'margin-top' : ''});
      $('.side p').css({'margin-top': ''});
    };
  };
};

function masterLock() {
  $( window ).scroll(lockSearch);
};

$(masterLock);
$(spin);
