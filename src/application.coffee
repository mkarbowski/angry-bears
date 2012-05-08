class Application
  constructor: ->
    @lastUpdate = 0
    @interval = 0
    @gameLoop = ->
      if !e.running then clearInterval a.interval
      timeDiff = new Date().getTime() - a.lastUpdate
      a.lastUpdate = a.lastUpdate + timeDiff
      e.update timeDiff
      e.draw()

  run: ->
    e.running = true
    e.initialize()    
    @interval = setInterval @gameLoop, 1000 / e.fps

a = new Application()