module.exports =
  activate: ->
    atom.workspaceView.command "bookmarklet:create", => @create()

  create: ->
    editor = atom.workspace.activePaneItem
    content = editor.getText()
    header = 'javascript:function(){';
    footer = '}();';
    out = header + encodeURIComponent(content) + footer;
    editor.insertText(out)
    atom.clipboard.write(out)
