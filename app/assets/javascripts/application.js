// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.fancybox.pack
//= require_tree .

$(function () {
    $(".imports-input").on("change", function (e) {
        var fileName = '';

        if (e.target.value) {
          fileName = e.target.value.split('\\').pop();
        }

        if (fileName) {
          $(".imports-label").text(fileName);
          $(".imports-submit").attr("disabled", false);
        } else {
          $(".imports-label").text("Choose file");
          $(".imports-submit").attr("disabled", true);
        }
    });

    $(".fancybox").fancybox({
        openEffect  : 'none',
        closeEffect : 'none'
    });
});
