class StageBackground
  @texture
  @packedBuffer
  @vertBuffer

  constructor: (filename) ->
    @packedBuffer = new Float32Array([
      -1.0, -1.0, 0.0,
        0.0, 0.0,
      -1.0, 1.0, 0.0,
        0.0, 1.0,
      1.0, 1.0, 0.0,
        1.0, 1.0,

      -1.0, -1.0, 0.0,
        0.0, 0.0,
      1.0, 1.0, 0.0,
        1.0, 1.0,
      1.0, -1.0, 0.0,
        1.0, 0.0
    ])

    @vertBuffer = new Float32Array([
      -1.0, -1.0, 0.0,
      -1.0, 1.0, 0.0,
      1.0, 1.0, 0.0,
      -1.0, -1.0, 0.0,
      1.0, 1.0, 0.0,
      1.0, -1.0, 0.0,
    ])

    @texBuffer = new Float32Array([
        0.0, 0.0,
        0.0, 1.0,
        1.0, 1.0,
        0.0, 0.0,
        1.0, 1.0,
        1.0, 0.0
    ])

    loadTexture filename, (tex) -> @texture = tex

  draw: ->
    
    vertBuffer = gl.createBuffer()
    gl.bindBuffer gl.ARRAY_BUFFER, vertBuffer
    gl.bufferData gl.ARRAY_BUFFER, @vertBuffer, gl.STATIC_DRAW
    
    gl.vertexAttribPointer shaderProgram.positionLocation, 3, gl.FLOAT, false, 0, 0
    gl.enableVertexAttribArray shaderProgram.positionLocation
    ###
    gl.activeTexture gl.TEXTURE0
    gl.bindTexture gl.TEXTURE_2D, @texture
    gl.uniform1i shaderProgram.samplerLocation, 0

    texBuffer = gl.createBuffer()
    gl.bindBuffer gl.ARRAY_BUFFER, texBuffer
    gl.bufferData gl.ARRAY_BUFFER, @texBuffer, gl.STATIC_DRAW

    gl.vertexAttribPointer shaderProgram.texCoordLocation, 2, gl.FLOAT, false, 0, 0
    gl.enableVertexAttribArray shaderProgram.texCoordLocation
    ###
    gl.drawArrays gl.TRIANGLES, 0, 6