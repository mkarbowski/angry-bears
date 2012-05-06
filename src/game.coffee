class Game
  
  @currentKey = null
  @stage = null

  constructor: ->
    @stage = new StageBackground("resources/red.png")

  draw: ->
    gl.clearColor 0.0, 0.0, 0.0, 1.0
    gl.viewport 0, 0, gl.viewportWidth, gl.viewportHeight
    gl.clear gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT
    @stage.draw()

  keyDown: (keyEvent) ->
    return true

  update: (time) ->
    return null