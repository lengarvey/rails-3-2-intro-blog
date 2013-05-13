QuickBlog.Views.Comments ||= {}

class QuickBlog.Views.Comments.CreateCommentView extends Backbone.View
  events:
    "submit": "commentSubmitted"

  commentSubmitted: (e) =>
    e.preventDefault()
    @submitForm()

  url: ->
    @$el.attr('action')

  data: ->
    @$el.serialize()

  submitForm: ->
    $.post(@url(), @data(), @commentPosted)

  commentPosted: (data) =>
    @appendComment(data)
    @resetForm()

  resetForm: ->
    @$el.map ->
      @reset()

  appendComment: (comment) ->
    $('#comments').append(comment)
