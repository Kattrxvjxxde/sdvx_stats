$(function() {
  // チェックボックスリセット
  $('.js-reset-checkbox').on('click', function() {
    var targets = $(this).parents('.js-reset-container').find('.js-reset-target');
    targets.prop('checked', false);
  });

  // テキストフィールドリセット
  $('.js-reset-text').on('click', function() {
    var targets = $(this).parents('.js-reset-container').find('.js-reset-target');
    targets.val('');
  });


  // 最下部で上部ページネーションを隠す
  $(window).on("scroll", function() {
    var scrollHeight = $(document).height();
    var scrollPosition = $(window).height() + $(window).scrollTop();
    if ((scrollHeight - scrollPosition) / scrollHeight <= 0.01) {
      // when scroll to bottom of the page
      $('.js-paginate').fadeOut();
    } else {
      $('.js-paginate').fadeIn();
    }
  });
});
