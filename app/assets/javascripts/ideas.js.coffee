# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("a.upvote[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    console.log("upvote")
    voted(data[0],data[1])
    changeup(data[0])
    
  $("a.downvote[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    console.log("downvote")
    voted(data[0],data[1])
    changedown(data[0])
    
  $("a.unvote[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    console.log("unvote")
    voted(data[0],data[1])
    resetvoting(data[0])
    
voted = (ideaid, votenumber) ->
    console.log("voted, refreshed votenumber and color to black")
    $("#idea-"+ideaid+"-votes").html(votenumber)
    $("#idea-"+ideaid+" .voting").css("color", "#000000")
    
changeup = (ideaid) ->
    console.log("changeup, color to teal, url to unvote, class to teal unupvote")
    $("#idea-"+ideaid+" .upvote").css("color", "#18bc9c")
    $("#idea-"+ideaid+" .upvote").attr("href", "/ideas/"+ideaid+"/unvote")
    $("#idea-"+ideaid+" .upvote").attr("class", "glyphicon glyphicon-arrow-up teal voting unvote")

changedown = (ideaid) ->
    console.log("changedown, color to teal, url to unvote, class to teal undownvote")
    $("#idea-"+ideaid+" .downvote").css("color", "#18bc9c")
    $("#idea-"+ideaid+" .downvote").attr("href", "/ideas/"+ideaid+"/unvote")
    $("#idea-"+ideaid+" .downvote").attr("class", "glyphicon glyphicon-arrow-down teal voting unvote")

resetvoting = (ideaid) ->
    console.log("resetvoting")
    console.log("url to upvote, class to upvote")
    $("#idea-"+ideaid+" .glyphicon-arrow-up").attr("href", "/ideas/"+ideaid+"/upvote")
    $("#idea-"+ideaid+" .glyphicon-arrow-up").attr("class", "glyphicon glyphicon-arrow-up voting upvote") 
    console.log("url to downvote, class to downvote")
    $("#idea-"+ideaid+" .glyphicon-arrow-down").attr("href", "/ideas/"+ideaid+"/downvote")
    $("#idea-"+ideaid+" .glyphicon-arrow-down").attr("class", "glyphicon glyphicon-arrow-down voting downvote")
    
    
    

    