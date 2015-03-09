# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("a.voting[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    $("#idea-"+data[0]+"-votes").html(data[1])