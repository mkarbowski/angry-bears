class GLProgram

  constructor: (@vScript, @fScript) ->
    @program = glUtils.createProgram vScript, fScript
    @matrixHandle = glUtils.getUniform program, "uMVPMatrix"
    @samplerHandle = glUtils.getUniform program, "uSampler2D"
    @textureHandle = glUtils.getAttrib program, "aTexCoord"
    @vertexHandle = glUtils.getAttrib program, "aVertCoord"  

  delete: ->
    glUtils.deleteProgram @program
  