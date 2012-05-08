class Camera2D
  constructor: ->
    @mvp = mat4.create()
    @pMatrix = mat4.create()
    @vMatrix = mat4.create()
    @tX = 0;
    @tY = 0;
    @rA = 0;    
  
  computeMVP: (model) ->
    model.translate @tX, @tY, 0
    model.rotate @rA, 0, 0, 1
    Matrix.multiplyMM(@mvp, 0, @vMatrix, 0, model, 0);
    Matrix.multiplyMM(@mvp, 0, @pMatrix, 0, @mvp, 0);
    @mvp
  
  lookAt: (x, y) ->
    Matrix.setLookAtM(@vMatrix, 0, 
        x, y, 3, 
        x, y, 0, 
        0, 1, 0);
  
  setBounds: (left, right, bottom, top, near, far) ->
    Matrix.orthoM(@pMatrix, 0, left, right, bottom, top, near, far);
  
  setRotate: (angle) ->
    @rA = angle
  
  setTranslate: (x, y) ->
    @tX = x
    @tY = y