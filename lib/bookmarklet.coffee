BookmarkletView = require './bookmarklet-view'

uglify = require 'uglify-js'

module.exports =
  bookmarkletView: null

  configDefaults:
    jqueryVersion: '1'
    useMinifiedJquery: true

  activate: (state) ->
    @bookmarkletView = new BookmarkletView(state.bookmarkletViewState)
    @linkPrefix = '<a href=\"'
    @linkSuffix = '\">Click Me</a>'
    @header = 'javascript:(function(){'
    @footer = '})();'
    @jqueryFile = '/jquery.js'
    @jqueryMinFile = '/jquery.min.js'
    @jqueryURL = '//ajax.googleapis.com/ajax/libs/jquery/'
    atom.commands.add 'atom-workspace',
      'bookmarklet:create-javaScript': =>
        @createJS(false)

      'bookmarklet:create-link': =>
        @createLink(false)

      'bookmarklet:create-javaScript-with-jquery': =>
        @createJS(true)

      'bookmarklet:create-link-with-jquery': =>
        @createLink(true)

    atom.config.onDidChange 'bookmarklet.jqueryVersion', ({newValue, oldValue}) =>
      @jqueryVersion = newValue

    atom.config.onDidChange 'bookmarklet.useMinifiedJquery', ({newValue, oldValue}) =>
      @useMinifiedJquery = newValue

  deactivate: ->
    @bookmarkletView.destroy()

  serialize: ->
    bookmarkletViewState: @bookmarkletView.serialize()

  createJS: (jquery) ->
    @create( { link: false, jquery: jquery } )
  createLink: (jquery) ->
    @create( { link: true, jquery: jquery } )

  create: (options) ->
    editor = atom.workspace.getActivePaneItem()
    grammar = editor.getGrammar()

    if grammar.name is 'JavaScript'
      content = editor.getText()


      if options.jquery
        jqueryToUse = @jqueryURL + @jqueryVersion

        if @useMinifiedJquery
          jqueryToUse += @jqueryMinFile
        else
          jqueryToUse += @jqueryFile

        code = 'var __hasjq = function () {' + content + '};' +
          'if (window.jQuery) __hasjq(); else {' +
          'var s = document.createElement("script");' +
          's.src = "' + jqueryToUse + '";' +
          's.onload = __hasjq;' +
          'document.body.appendChild(s);}';
      else
        code = content

      # Call uglify to get rid of spaces, new lines, etc.
      ug = uglify.minify(code, { fromString: true })

      out = ''

      if options.link
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
