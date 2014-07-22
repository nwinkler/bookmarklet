BookmarkletView = require './bookmarklet-view'

uglify = require 'uglify-js'

module.exports =
  bookmarkletView: null

  activate: (state) ->
    @bookmarkletView = new BookmarkletView(state.bookmarkletViewState)
    @header = 'javascript:(function(){';
    @footer = '})();';
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

      # Call uglify to get rid of spaces, new lines, etc.
      ug = uglify.minify(content, { fromString: true })
      out = @header + ug.code + @footer;

      # Copy the text to the clipboard
      atom.clipboard.write(out)

      # Show a message to the user
      @bookmarkletView.show('Copied bookmarklet to the clipboard')
    else
      # Show a message to the user
      @bookmarkletView.show('Bookmarklet only works for JavaScript files')
