// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
$(document).ready(function() {

		(function() {
		  jQuery(function() {
		    $('form').on('click', '.remove_multiple_level_nested_fields', function(event) {
		      $(this).prev('input[type=hidden]').val('1');
		      $(this).closest('fieldset').hide();
		      return event.preventDefault();
		    });
		    $('form').on('click', '.remove_table_nested_fields', function(event) {
		      $(this).prev('input[type=hidden]').val('1');
		      $(this).closest('tr').hide();
		      return event.preventDefault();
		    });

		    return $('form').on('click', '.add_multiple_level_nested_fields', function(event) {
		      var regexp, time;
		      time = new Date().getTime();
		      regexp = new RegExp($(this).data('id'), 'g');
		      $(this).before($(this).data('fields').replace(regexp, time));
		      return event.preventDefault();
		    });

		  });
		}).call(this);

		$('form a.add_multiple_level_nested_table_fields').click(function(event) {
      var regexp, time;
      time = new Date().getTime();
      regexp = new RegExp($(this).data('id'), 'g');
			$(this).prev().find("tbody").attr("class", "ultimo_tbody_" + time);
			var tbody = $(".ultimo_tbody_" + time).last();
			tbody.append($(this).data('fields').replace(regexp, time));
      return false;
    });
});
