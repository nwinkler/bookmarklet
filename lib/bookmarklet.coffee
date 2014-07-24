BookmarkletView = require './bookmarklet-view'

uglify = require 'uglify-js'

module.exports =
  bookmarkletView: null
  includeJQuery: false

  configDefaults:
    includeJQuery: false

  activate: (state) ->
    @bookmarkletView = new BookmarkletView(state.bookmarkletViewState)
    @linkPrefix = '<a href=\"'
    @linkSuffix = '\">Click Me</a>'
    @header = 'javascript:(function(){'
    @footer = '})();'
    atom.workspaceView.command "bookmarklet:create-javaScript", => @createJS()
    atom.workspaceView.command "bookmarklet:create-link", => @createLink()

  deactivate: ->
    @bookmarkletView.destroy()

  serialize: ->
    bookmarkletViewState: @bookmarkletView.serialize()

  createJS: ->
    @create( { link: false } )
  createLink: ->
    @create( { link: true } )

  create: (options) ->
    editor = atom.workspace.activePaneItem
    grammar = editor.getGrammar()

    if grammar.name is 'JavaScript'
      content = editor.getText()

      # Call uglify to get rid of spaces, new lines, etc.
      ug = uglify.minify(content, { fromString: true })

      out = ''

      if options && options.link
        out = @linkPrefix

      out = out + @header + encodeURIComponent(ug.code) + @footer

      if options && options.link
        out = out + @linkSuffix

      # Copy the text to the clipboard
      atom.clipboard.write(out)

      # Show a message to the user
      @bookmarkletView.show('Copied bookmarklet to the clipboard', 'ok')
    else
      # Show a message to the user
      @bookmarkletView.show('Bookmarklet only works for JavaScript files', 'error')
