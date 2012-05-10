class Background
  constructor: (file) ->
    @sprite = undefined
    xmlHttp = new XMLHttpRequest()
    that = this
    xmlHttp.onreadystatechanged = ->
      dom = that.xmlHttp.requestXml
      @sprite = new Sprite dom.getElementsByTagName('Sprite')[0]

    @model = mat4.create()
    mat4.setIdentity @model

  draw: (camera) ->
    @sprite.draw camera, @model