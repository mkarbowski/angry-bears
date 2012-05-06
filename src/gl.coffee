gl = null
shaderProgram = null

initGL = (canvas) ->
  try
    gl = canvas.getContext("experimental-webgl")
    gl.viewportWidth = canvas.width
    gl.viewportHeight = canvas.height
    gl.
  catch e
    alert "Could not init webGL"

createProgram = ->
  shaderProgram = gl.createProgram()
  gl.attachShader shaderProgram, loadShader 'shader-fs'
  gl.attachShader shaderProgram, loadShader 'shader-vs'
  gl.linkProgram shaderProgram

  linked = gl.getProgramParameter shaderProgram, gl.LINK_STATUS
  if !linked then alert 'not linked'

  shaderProgram.positionLocation = gl.getAttribLocation shaderProgram, 'a_position'
  shaderProgram.texCoordLocation = gl.getAttribLocation shaderProgram, 'a_texCoord'
  shaderProgram.samplerLocation = gl.getUniformLocation shaderProgram, 'u_image'
  shaderProgram.resolutionLocation = gl.getUniformLocation shaderProgram, 'u_resolution'

  shaderProgram

loadShader = (id) ->
  elt = document.getElementById id
  shaderType = elt['type']
  shaderSource = elt.textContent
  shader = gl.createShader if shaderType == 'x-shader/x-vertex' then gl.VERTEX_SHADER else gl.FRAGMENT_SHADER
  gl.shaderSource shader, shaderSource
  gl.compileShader shader

  compiled = gl.getShaderParameter shader, gl.COMPILE_STATUS
  if !compiled then alert 'not compiled'

  shader

loadTexture = (file, callback) ->
  texture = gl.createTexture()
  gl.bindTexture gl.TEXTURE_2D, texture

  image = new Image()
  image.src = "resources/red.png"
  image.onload = ->
    callback(handleTextureLoaded(image, texture))

handleTextureLoaded = (image, texture) ->
  gl.texParameteri gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE
  gl.texParameteri gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE
  gl.texParameteri gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST
  gl.texParameteri gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST

  gl.texImage2D gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, image  
  texture

webGLStart = ->
  canvas = document.getElementById "game_canvas"
  initGL canvas

  gl.clearColor 0.0, 0.0, 0.0, 1.0
  gl.enable gl.DEPTH_TEST

  createProgram()