class Background
  constructor: (file) ->
    @loaded = false
    @sprite = null
    @xmlHttp = new XMLHttpRequest()
    that = this    
    @xmlHttp.onreadystatechanged = ->
      dom = that.xmlHttp.requestXml
      that.sprite = new Sprite dom.getElementsByTagName('Sprite')[0]
      that.loaded = true
      alert 'lol'
    @xmlHttp.open 'GET', file, false
    @xmlHttp.send()
    @model = mat4.create()
    mat4.identity @model

  draw: (camera) ->
    if @sprite? and @sprite.loaded
      @sprite.draw camera, @model

  load: ->
    #@sprite.load()
    return null

  unload: ->
    @sprite.unload()
    return null