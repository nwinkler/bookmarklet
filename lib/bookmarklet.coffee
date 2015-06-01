uglify = require 'uglify-js'

module.exports =
  config:
    jqueryVersion:
      type: 'string'
      default: '1'
      title: 'jQuery Version'
    useMinifiedJquery:
      type: 'boolean'
      default: true
      title: 'Use Minified jQuery'

  bookmarkletView: null

  activate: (state) ->
    @linkPrefix = '<a href=\"'
    @linkSuffix = '\">Click Me</a>'
    @header = 'javascript:(function(){'
    @footer = '})();'
    @jqueryFile = '/jquery.js'
    @jqueryMinFile = '/jquery.min.js'
    @jqueryURL = '//ajax.googleapis.com/ajax/libs/jquery/'

    atom.commands.add 'atom-text-editor',
      'bookmarklet:create-javaScript': =>
        @createJS(false)

    atom.commands.add 'atom-text-editor',
      'bookmarklet:create-link': =>
        @createLink(false)

    atom.commands.add 'atom-text-editor',
      'bookmarklet:create-javaScript-with-jquery': =>
        @createJS(true)

    atom.commands.add 'atom-text-editor',
      'bookmarklet:create-link-with-jquery': =>
        @createLink(true)

    atom.config.onDidChange 'bookmarklet.jqueryVersion', ({newValue, oldValue}) =>
      @jqueryVersion = newValue

    @jqueryVersion = atom.config.get 'bookmarklet.jqueryVersion'

    atom.config.onDidChange 'bookmarklet.useMinifiedJquery', ({newValue, oldValue}) =>
      @useMinifiedJquery = newValue

    @useMinifiedJquery = atom.config.get 'bookmarklet.useMinifiedJquery'

  notifySuccess: (message) ->
    atom.notifications.addSuccess(message)

  notifyWarning: (message) ->
    atom.notifications.addWarning(message)

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
      @notifySuccess 'Copied bookmarklet to the clipboard'
    else
      # Show a message to the user
      @notifyWarning 'Bookmarklet only works for JavaScript files'
