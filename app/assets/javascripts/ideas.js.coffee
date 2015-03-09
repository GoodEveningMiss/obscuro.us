# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("a.upvote[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    voted(data[0],data[1])
    changeup(data[0])
    
  $("a.downvote[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    voted(data[0],data[1])
    changedown(data[0])
    
voted = (ideaid, votenumber) ->
    $("#idea-"+ideaid+"-votes").html(votenumber)
    $("#idea-"+ideaid+" .voting").css("color", "#000000")
    
changeup = (ideaid) ->
    $("#idea-"+ideaid+" .upvote").css("color", "#18bc9c")

changedown = (ideaid) ->
    $("#idea-"+ideaid+" .downvote").css("color", "#18bc9c")
    
    
    

    