class GlTexture

  constructor: (imageFile) ->
    isLoaded = false
    
    texture = gl.createTexture()
    gl.bindTexture gl.TEXTURE_2D, @texture
    gl.texParameteri gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST
    gl.texParameteri gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST
    gl.texParameteri gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE
    gl.texParameteri gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE
    
    image = new Image()
    image.onload = ->
      @isLoaded = true
      gl.bindTexture gl.TEXTURE_2D, @texture
      gl.texImage2D gl.TEXTURE_2D, 0, image, true      

    image.src = imageFile

    `function secretTexture() { return texture; }`

    `function secretLoaded() { return isLoaded; }`

    @isLoaded = -> 
      secretLoaded()

    @getTexture = ->
      secretTexture()

  delete: ->
    glUtils.deleteTexture @getTexture()