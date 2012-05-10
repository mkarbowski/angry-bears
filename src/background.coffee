class Background
  constructor: (file) ->
    @loaded = false
    @sprite = null
    @xmlHttp = new XMLHttpRequest()
    that = this    
    @xmlHttp.open 'GET', file, false
    @xmlHttp.send()
    dom = @xmlHttp.responseXML
    @sprite = new Sprite dom.getElementsByTagName('Sprite')[0]
    @loaded = true
    @model = mat4.create()
    mat4.identity @model

  draw: (camera) ->
    if @sprite?
      @sprite.draw camera, @model

  load: ->
    @sprite.load()
    @sprite.setAnimation 'background_sample'
    return null

  unload: ->
    @sprite.unload()
    return null