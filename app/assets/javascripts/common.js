$(function() {
  $('.js-reset-checkbox').on('click', function() {
    var targets = $(this).parents('.js-reset-container').find('.js-reset-target');
    targets.prop('checked', false);
  });

  $('.js-reset-text').on('click', function() {
    var targets = $(this).parents('.js-reset-container').find('.js-reset-target');
    targets.val('');
  });
});
