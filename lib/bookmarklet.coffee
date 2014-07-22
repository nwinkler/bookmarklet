BookmarkletView = require './bookmarklet-view'

module.exports =
  bookmarkletView: null

  activate: (state) ->
    @bookmarkletView = new BookmarkletView(state.bookmarkletViewState)

  deactivate: ->
    @bookmarkletView.destroy()

  serialize: ->
    bookmarkletViewState: @bookmarkletView.serialize()
