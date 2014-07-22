{View} = require 'atom'

module.exports =
class BookmarkletView extends View
  @content: ->
    @div class: 'bookmarklet overlay from-top', =>
      @div "Bookmarklet has been copied to the system clipboard", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "bookmarklet:create", => @create()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  create: ->
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)

      setTimeout(=>
        @detach()
      , 1000)
