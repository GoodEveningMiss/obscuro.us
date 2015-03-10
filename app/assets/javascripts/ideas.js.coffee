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
    
  $("a.unupvote[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    console.log("unupvote")
    voted(data[0],data[1])
    resetup(data[0])

  $("a.undownvote[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    console.log("undownvote")
    voted(data[0],data[1])
    resetdown(data[0])
    
voted = (ideaid, votenumber) ->
    console.log("voted, refreshed votenumber and color to black")
    $("#idea-"+ideaid+"-votes").html(votenumber)
    $("#idea-"+ideaid+" .voting").css("color", "#000000")
    
changeup = (ideaid) ->
    console.log("changeup, color to teal, url to unvote, class to teal unupvote")
    $("#idea-"+ideaid+" .upvote").css("color", "#18bc9c")
    $("#idea-"+ideaid+" .upvote").attr("href", "/ideas/"+ideaid+"/unvote")
    $("#idea-"+ideaid+" .upvote").attr("class", "glyphicon glyphicon-arrow-up teal voting unupvote")
    
resetup = (ideaid) ->
    console.log("resetup, url to upvote, class to upvote")
    $("#idea-"+ideaid+" .unupvote").attr("href", "/ideas/"+ideaid+"/upvote")
    $("#idea-"+ideaid+" .unupvote").attr("class", "glyphicon glyphicon-arrow-up voting upvote") 

changedown = (ideaid) ->
    console.log("changedown, color to teal, url to unvote, class to teal undownvote")
    $("#idea-"+ideaid+" .downvote").css("color", "#18bc9c")
    $("#idea-"+ideaid+" .downvote").attr("href", "/ideas/"+ideaid+"/unvote")
    $("#idea-"+ideaid+" .downvote").attr("class", "glyphicon glyphicon-arrow-down teal voting undownvote")
    
resetdown = (ideaid) ->
    console.log("resetdown, url to downvote, class to downvote")
    $("#idea-"+ideaid+" .undownvote").attr("href", "/ideas/"+ideaid+"/downvote")
    $("#idea-"+ideaid+" .undownvote").attr("class", "glyphicon glyphicon-arrow-down voting downvote")
    
    
    

    