class Application

  @game
  @running
  @lastUpdate

  constructor: ->
    @game = new Game()
    @running = false
    document.onkeydown = @game.keyDown event

  runGame: ->
    @running = true
    while @running
      setInterval(tick, 1000/60)      
    return null

  tick: ->
    thisUpdate = Date().Now
    timeDiff = thisUpdate - @lastUpdate 
    theGame.draw()
    theGame.update(timeDiff)
    getElementById('game_canvas').text = timeDiff
