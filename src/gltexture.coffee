class GLTexture

  constructor: (imageFile) ->
    @texture = gl.createTexture()
    gl.bindTexture gl.TEXTURE_2D, @texture
    gl.texImage2D gl.TEXTURE_2D, 0, gl.RGBA, 1, 1, 0, gl.RGBA, gl.UNSIGNED_BYTE, new Uint8Array([0,0,255,255])
    gl.texParameteri gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST
    gl.texParameteri gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST
    gl.texParameteri gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE
    gl.texParameteri gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE
    
    @image = new Image()
    that = this
    @image.onload = ->
      gl.bindTexture gl.TEXTURE_2D, that.texture
      gl.texImage2D gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, that.image

    @image.src = imageFile

  delete: ->
    glUtils.deleteTexture @texture