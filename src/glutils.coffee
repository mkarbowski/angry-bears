gl = null

class GLUtils
  
  constructor: ->
    @programs = new Object()
    @activeProgram = null
  
  addProgram: (name, program) ->
    if @programs['name']?
      alert 'Program named: \'{# name}\' already loaded'
    else
      @programs['name'] = program

  loadShader: (type, code) ->
    shader = gl.createShader type    
    gl.shaderSource shader, code
    gl.compileShader shader    
    shader

  createProgram: (vScript, fScript) ->
    prog = gl.createProgram()    
    vertexShader = @loadShader gl.VERTEX_SHADER, vScript
    fragmentShader = @loadShader gl.FRAGMENT_SHADER, fScript    
    gl.attachShader prog, vertexShader
    gl.attachShader prog, fragmentShader
    gl.linkProgram prog    
    prog

  deleteProgram: (prog) ->
    gl.deleteProgram prog
  
  deleteTexture: (tex) ->
    gl.deleteTextures 1, tex, 0
  
  getAttrib: (prog, attrib) ->  
    gl.getAttribLocation prog, attrib
  
  getUniform: (prog, attrib) ->
    gl.getUniformLocation prog, attrib

  initWebGL: (canvas) ->
    try   
      gl = canvas.getContext('webgl') || canvas.getContext('experimental-webgl')
    catch error
    if (!gl) then alert 'Unable to initialize WebGL. Your browser may not support it.'

  setTextureBuffer: (buffer, offset, stride) ->
    gl.bindBuffer gl.ARRAY_BUFFER, buffer
    gl.enableVertexAttribArray @activeProgram.textureHandle
    gl.vertexAttribPointer @activeProgram.textureHandle, 2, gl.FLOAT, false, stride, offset    
  
  setVertexBuffer: (buffer, offset, stride) ->
    gl.bindBuffer gl.ARRAY_BUFFER, buffer
    gl.enableVertexAttribArray @activeProgram.vertexHandle
    gl.vertexAttribPointer @activeProgram.vertexHandle, 3, gl.FLOAT, false, stride, offset
      
  useCamera: (cam, model) ->
    gl.uniformMatrix4fv @activeProgram.matrixHandle, false, cam.computeMVP(model)
  
  useProgram: (name) ->
    program = @programs['name']
    if program? 
      @activeProgram = @programs['name']
      gl.useProgram @activeProgram.program
    else
      alert 'Program: \'{# name}\' does not exist'
  
  useTexture: (texture) ->
      gl.activeTexture gl.TEXTURE0
      got = texture.texture
      gl.bindTexture gl.TEXTURE_2D, got
      gl.uniform1i @activeProgram.samplerHandle, 0

glUtils = new GLUtils()