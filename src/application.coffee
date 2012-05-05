class Application

  @game
  @running
  @lastUpdate
  @updateCallback

  init: ->
    webGLStart()
    @game = new Game()
    @running = false
    @lastUpdate = new Date().getTime()
    document.onkeydown = @game.keyDown event

  tick: ->
    if !application.running then clearInterval application.updateCallback
    thisUpdate = new Date().getTime()
    timeDiff = thisUpdate - application.lastUpdate 
    application.lastUpdate = thisUpdate
    application.game.draw()
    application.game.update timeDiff
    document.getElementById('text').textContent = timeDiff

  runGame: ->
    @init()
    @running = true
    @updateCallback = setInterval @tick, 1000/60      
    return null

application = new Application()