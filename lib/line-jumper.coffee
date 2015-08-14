module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', 'half-pager:half-page-up', ->
      editor = atom.workspace.getActiveTextEditor()
      return if not editor?

      scrollCount = Math.max 1, editor.getRowsPerPage() // 2
      editorElement = atom.views.getView editor
      firstVisibleScreenRow = editorElement.getFirstVisibleScreenRow()

      editor.moveUp scrollCount
      editor.scrollToScreenPosition [(Math.max 0, firstVisibleScreenRow - scrollCount), 0]

    atom.commands.add 'atom-workspace', 'half-pager:half-page-down', ->
      editor = atom.workspace.getActiveTextEditor()
      return if not editor?

      scrollCount = Math.max 1, editor.getRowsPerPage() // 2
      lastScreenRow = editor.getLastScreenRow()
      editorElement = atom.views.getView editor
      firstVisibleScreenRow = editorElement.getFirstVisibleScreenRow()

      editor.moveDown scrollCount
      editor.scrollToScreenPosition [(Math.min lastScreenRow, firstVisibleScreenRow + scrollCount), 0]

    atom.commands.add 'atom-workspace', 'half-pager:select-half-page-up', ->
      editor = atom.workspace.getActiveTextEditor()
      return if not editor?
  
      scrollCount = Math.max 1, editor.getRowsPerPage() // 2

      editor.selectUp scrollCount

    atom.commands.add 'atom-workspace', 'half-pager:select-half-page-down', ->
      editor = atom.workspace.getActiveTextEditor()
      return if not editor?
  
      scrollCount = Math.max 1, editor.getRowsPerPage() // 2

      editor.selectDown scrollCount
