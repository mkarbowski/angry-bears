class Application
  constructor: ->
    @lastUpdate = 0
    @request = undefined
    that = this
    @gameLoop = ->
      if !e.running then cancelAnimFrame a.request
      timeDiff = new Date().getTime() - that.lastUpdate
      that.lastUpdate = that.lastUpdate + timeDiff
      e.update timeDiff
      e.draw()
      that.request = requestAnimFrame that.gameLoop

  run: ->
    e.running = true
    e.initialize()    
    @gameLoop()

a = new Application()