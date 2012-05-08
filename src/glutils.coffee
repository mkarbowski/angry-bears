class GLUtils
  
  constructor: ->
    @programs = new Object()
    @activeProgram = null
  
  addShader: (name, program) ->
    if programs['name'] == null 
      programs['name'] = program
    else
      alert 'Program named: \'{# name}\' already loaded' 
  
  deleteProgram: (prog) ->
    gl.deleteProgram prog
  
  deleteTexture: (tex) ->
    gl.deleteTextures 1, tex, 0
  
  getAttrib: (prog, attrib) ->  
    gl.getAttribLocation prog, attrib
  
  getUniform: (prog, attrib) ->
    gl.GetUniformLocation prog, attrib
  
  setTextureBuffer: (buffer, offset, stride) ->
    gl.vertexAttribPointer @activeProgram.textureHandle, 2, gl.FLOAT, false, stride, offset
    gl.enableVertexAttribArray @activeProgram.textureHandle
  
  setVertexBuffer: (buffer, offset, stride) ->
    gl.vertexAttribPointer @activeShader.vertexHandle, 3, gl.FLOAT, false, stride, offset
    gl.enableVertexAttribArray @activeShader.vertexHandle
  
  useCamera: (cam) ->
    gl.uniformMatrix4fv @activeProgram.matrixHandle, 1, false, cam.getMVP(), 0
  
  useProgram: (name) ->
    shader = @programs['name']
    if shader? 
      @activeShader = @programs['name']
      gl.useProgram @activeProgram.program
    else
      alert 'Program: \'{# name}\' does not exist'
  
  useTexture: (texture) ->
    if texture.isLoaded() 
      gl.activeTexture gl.TEXTURE0
      gl.bindTexture gl.TEXTURE_2D, texture
      gl.uniform1i @activeProgram.samplerHandle, 0
    else
      alert 'Texture has not yet loaded'