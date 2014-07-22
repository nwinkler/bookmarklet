{View} = require 'atom'

module.exports =
class BookmarkletView extends View
  @content: ->
    @div class: 'bookmarklet overlay from-top', =>
      @div "The Bookmarklet package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "bookmarklet:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "BookmarkletView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
