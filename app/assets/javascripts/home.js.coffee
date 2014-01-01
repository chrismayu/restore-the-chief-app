# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  
  # Support for AJAX loaded modal window.
  # Focuses on first input textbox after it loads the window.
  $("[data-toggle=\"modal\"]").click (e) ->
    e.preventDefault()
    url = $(this).attr("href")
    if url.indexOf("#") is 0
      $(url).modal "open"
    else
      $.get(url, (data) ->
        $("<div class=\"modal hide fade\">" + data + "</div>").modal()
      ).success ->
        $("input:text:visible:first").focus()



$.backstretch "http://dl.dropbox.com/u/515046/www/garfield-interior.jpg"  
 
