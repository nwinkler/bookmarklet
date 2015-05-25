{View} = require 'atom-space-pen-views'

module.exports =
class BookmarkletView extends View
  @content: ->
    @div class: 'bookmarklet overlay from-top', =>
      @div class: "message", =>
        @span outlet: "status"
        @span outlet: "message", class: "message"

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  show: (pMessage, pStatus) ->
    switch pStatus
      when 'ok'
        @status.attr('class', 'icon-check padded text-success')
        @message.attr('class', 'message text-success')
      when 'error'
        @status.attr('class', 'icon-stop padded text-error')
        @message.attr('class', 'message text-error')

    @message.text pMessage

    @panel ?= atom.workspace.addModalPanel(item: this)
    @panel.show()

    setTimeout(=>
      @close()
    , 2000)

  close: ->
    panelToDestroy = @panel
    @panel = null
    panelToDestroy?.destroy()
