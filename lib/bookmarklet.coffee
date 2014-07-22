BookmarkletView = require './bookmarklet-view'

uglify = require 'uglify-js'

module.exports =
  bookmarkletView: null

  activate: (state) ->
    @bookmarkletView = new BookmarkletView(state.bookmarkletViewState)
    atom.workspaceView.command "bookmarklet:create", => @create()

  deactivate: ->
    @bookmarkletView.destroy()

  serialize: ->
    bookmarkletViewState: @bookmarkletView.serialize()

  create: ->
    editor = atom.workspace.activePaneItem
    grammar = editor.getGrammar()

    if grammar.name is 'JavaScript'
      content = editor.getText()
      header = 'javascript:(function(){';
      footer = '})();';
      ug = uglify.minify(content, { fromString: true })
      out = header + ug.code + footer;
      # editor.insertText(out)
      atom.clipboard.write(out)
      @bookmarkletView.show('Copied bookmarklet to the clipboard')
    else
      @bookmarkletView.show('Bookmarklet only works for JavaScript files')
