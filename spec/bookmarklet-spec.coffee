{WorkspaceView} = require 'atom'
Bookmarklet = require '../lib/bookmarklet'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "Bookmarklet", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('bookmarklet')

  describe "when the bookmarklet:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.bookmarklet')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'bookmarklet:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.bookmarklet')).toExist()
        atom.workspaceView.trigger 'bookmarklet:toggle'
        expect(atom.workspaceView.find('.bookmarklet')).not.toExist()
