class GLTexture

  constructor: (imageFile) ->
    loaded = false
    
    texture = gl.createTexture()
    gl.bindTexture gl.TEXTURE_2D, @texture
    gl.texParameteri gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST
    gl.texParameteri gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST
    gl.texParameteri gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE
    gl.texParameteri gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE
    
    image = new Image()
    image.onload = ->
      loaded = true
      gl.bindTexture gl.TEXTURE_2D, @texture
      gl.texImage2D gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, image  

    image.src = imageFile

    `function secretTexture() { return texture; }`

    `function secretLoaded() { return loaded; }`

    @isLoaded = -> 
      secretLoaded()

    @getTexture = ->
      secretTexture()

  delete: ->
    glUtils.deleteTexture @getTexture()