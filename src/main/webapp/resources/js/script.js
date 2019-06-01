$(document).ready(function() {
    var stickyNavTop = $('.meni').offset().top;

    var stickyNav = function(){
        var scrollTop = $(window).scrollTop();

        if (scrollTop > stickyNavTop) {
            $('.meni').addClass('sticky');
        } else {
            $('.meni').removeClass('sticky');
        }
    };

    stickyNav();

    $(window).scroll(function() {
        stickyNav();
    });
});
