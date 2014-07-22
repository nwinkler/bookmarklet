module.exports =
  activate: ->
    atom.workspaceView.command "bookmarklet:create", => @create()

  create: ->
    editor = atom.workspace.activePaneItem
