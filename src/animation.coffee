class Animation
  constructor: (frameCount, resources)->
    @currentFrame = 0
    @frameCount = frameCount
    @frameRemainder = 0
    @resources = resources
    @textures = undefined
    @loaded = false

  consumeTime: (elapsed) ->
    frames = (elapsed + @frameRemainder) % (1000 / e.fps)
    @frameRemainder = (elapsed + @frameRemainder) - (frames * (1000 / e.fps))
    @currentFrame = (@currentFrame + frames) % @frameCount

  reset: ->
    @currentFrame = 0

  texture: ->
    @textures[@currentFrame]

  load: ->
    for file in @resources
      @textures.push new GLTexture 'resources/' + file
    return null

  unload: ->
    for texture in @textures
      texture.delete()
    @textures = []
    return null