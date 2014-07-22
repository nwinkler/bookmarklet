{View} = require 'atom'

module.exports =
class BookmarkletView extends View
  @content: ->
    @div class: 'bookmarklet overlay from-top', =>
      @div outlet: "message", class: "message"

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  show: (pMessage) ->
    if @hasParent()
      @detach()
    else
      @message.text pMessage

      atom.workspaceView.append(this)

      setTimeout(=>
        @detach()
      , 1000)
