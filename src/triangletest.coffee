class TriangleTest
  constructor: ->
    @vertCoords = new Float32Array([0,0,4,1,1,4,0,1,4])
    @texCoords = new Float32Array([0,0,1,1,0,1])
    @texture = new GLTexture 'resources/red.png'
    @model = mat4.create()
    mat4.identity(@model)

  draw: (camera) ->
    glUtils.useTexture @texture
    glUtils.useCamera camera, @model
    vertBuffer = gl.createBuffer()
    gl.bindBuffer gl.ARRAY_BUFFER, vertBuffer
    gl.bufferData(gl.ARRAY_BUFFER, @vertCoords, gl.STATIC_DRAW);
    glUtils.setVertexBuffer vertBuffer, 0, 0
    texBuffer = gl.createBuffer()
    gl.bindBuffer gl.ARRAY_BUFFER, texBuffer
    gl.bufferData(gl.ARRAY_BUFFER, @texCoords, gl.STATIC_DRAW);
    glUtils.setTextureBuffer texBuffer, 0, 0
    gl.drawArrays gl.TRIANGLES, 0 , 3