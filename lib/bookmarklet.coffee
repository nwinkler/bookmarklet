uglify = require 'uglify-js'

module.exports =
  activate: ->
    atom.workspaceView.command "bookmarklet:create", => @create()

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
      alert('Copied bookmarklet to the clipboard')
    else
      alert('Bookmarklet only works for JavaScript files')
