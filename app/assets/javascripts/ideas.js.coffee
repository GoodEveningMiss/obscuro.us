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
    
  $("a.unupvote[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    voted(data[0],data[1])
    resetup(data[0])

  $("a.undownvote[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    voted(data[0],data[1])
    resetdown(data[0])
    
voted = (ideaid, votenumber) ->
    $("#idea-"+ideaid+"-votes").html(votenumber)
    $("#idea-"+ideaid+" .voting").css("color", "#000000")
    
changeup = (ideaid) ->
    $("#idea-"+ideaid+" .upvote").css("color", "#18bc9c")
    $("#idea-"+ideaid+" .upvote").attr("href", "/ideas/"+ideaid+"/unupvote")
    $("#idea-"+ideaid+" .upvote").attr("class", "glyphicon glyphicon-arrow-up voting unupvote")
    $("#idea-"+ideaid+" .undownvote").attr("href", "/ideas/"+ideaid+"/downvote")
    $("#idea-"+ideaid+" .undownvote").attr("class", "glyphicon glyphicon-arrow-down voting downvote")
    
    
resetup = (ideaid) ->
    $("#idea-"+ideaid+" .unupvote").attr("href", "/ideas/"+ideaid+"/upvote")
    $("#idea-"+ideaid+" .unupvote").attr("class", "glyphicon glyphicon-arrow-up voting upvote") 
    $("#idea-"+ideaid+" .undownvote").attr("href", "/ideas/"+ideaid+"/downvote")
    $("#idea-"+ideaid+" .undownvote").attr("class", "glyphicon glyphicon-arrow-down voting downvote")

changedown = (ideaid) ->
    $("#idea-"+ideaid+" .downvote").css("color", "#18bc9c")
    $("#idea-"+ideaid+" .downvote").attr("href", "/ideas/"+ideaid+"/undownvote")
    $("#idea-"+ideaid+" .downvote").attr("class", "glyphicon glyphicon-arrow-down voting undownvote")
    $("#idea-"+ideaid+" .unupvote").attr("href", "/ideas/"+ideaid+"/upvote")
    $("#idea-"+ideaid+" .unupvote").attr("class", "glyphicon glyphicon-arrow-up voting upvote") 
    
resetdown = (ideaid) ->
    $("#idea-"+ideaid+" .unupvote").attr("href", "/ideas/"+ideaid+"/upvote")
    $("#idea-"+ideaid+" .unupvote").attr("class", "glyphicon glyphicon-arrow-up voting upvote") 
    $("#idea-"+ideaid+" .undownvote").attr("href", "/ideas/"+ideaid+"/downvote")
    $("#idea-"+ideaid+" .undownvote").attr("class", "glyphicon glyphicon-arrow-down voting downvote")
 
    

    