$(function() {
    $('<img/>').attr('src', '/assets/bg.jpg').load(function() {
        $(this).remove();
        window.setTimeout(function() {
            $('.animate').removeClass('animate');
        }, 500);
    });
});
