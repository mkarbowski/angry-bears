class Mesh
  constructor: (vert, tex) ->
    @size = vert.length / 3
    @vertCoords = vert
    @texCoords = tex
    @vertBuffer = null
    @texBuffer = null
    @loaded = false

  load: () ->
    @texBuffer = gl.createBuffer()
    gl.bindBuffer gl.ARRAY_BUFFER, @texBuffer
    gl.bufferData gl.ARRAY_BUFFER, @texCoords, gl.STATIC_DRAW
    @vertBuffer = gl.createBuffer()
    gl.bindBuffer gl.ARRAY_BUFFER, @vertBuffer
    gl.bufferData gl.ARRAY_BUFFER, @vertCoords, gl.STATIC_DRAW
    @loaded = true

  unload: () ->
    gl.deleteBuffer @texBuffer
    gl.deleteBuffer @vertBuffer
    @loaded = false