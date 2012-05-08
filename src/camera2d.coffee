class Camera2D
  constructor: ->
    @mvp = mat4.create()
    @pMatrix = mat4.create()
    @vMatrix = mat4.create()
    @tX = 0;
    @tY = 0;
    @rA = 0;    
  
  computeMVP: (model) ->
    mat4.translate model, [@tX, @tY, 0], @mvp
    mat4.rotateZ @mvp, @rA, @mvp
    mat4.multiply @vMatrix, @mvp, @mvp
    mat4.multiply @pMatrix, @mvp, @mvp
    @mvp
  
  lookAt: (x, y) ->
    mat4.lookAt [x, y, 3], [x, y, 0], [0, 1, 0], @vMatrix
  
  setBounds: (left, right, bottom, top, near, far) ->
    mat4.ortho left, right, bottom, top, 3, 7, @pMatrix
  
  setRotate: (angle) ->
    @rA = angle
  
  setTranslate: (x, y) ->
    @tX = x
    @tY = y