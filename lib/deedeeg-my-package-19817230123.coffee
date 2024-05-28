DeedeegMyPackage19817230123View = require './deedeeg-my-package-19817230123-view'
{CompositeDisposable} = require 'atom'

module.exports = DeedeegMyPackage19817230123 =
  deedeegMyPackage19817230123View: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @deedeegMyPackage19817230123View = new DeedeegMyPackage19817230123View(state.deedeegMyPackage19817230123ViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @deedeegMyPackage19817230123View.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'deedeeg-my-package-19817230123:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @deedeegMyPackage19817230123View.destroy()

  serialize: ->
    deedeegMyPackage19817230123ViewState: @deedeegMyPackage19817230123View.serialize()

  toggle: ->
    console.log 'DeedeegMyPackage19817230123 was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
