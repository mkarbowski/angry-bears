// Generated by CoffeeScript 1.3.1
var Engine, e;

Engine = (function() {

  Engine.name = 'Engine';

  function Engine() {
    this.fps = 30;
    this.initialized = false;
    this.running = false;
    this.worldCam = null;
    this.triangle = null;
    this.basicProgram = 'basic';
  }

  Engine.prototype.draw = function() {
    gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
    return this.triangle.draw(this.worldCam);
  };

  Engine.prototype.initialize = function() {
    var canvas, fScript, vScript;
    canvas = document.getElementById('game_canvas');
    glUtils.initWebGL(canvas);
    if ((typeof gl !== "undefined" && gl !== null)) {
      gl.viewport(0, 0, canvas.width, canvas.height);
      gl.clearColor(0.0, 0.0, 0.0, 1.0);
      gl.enable(gl.DEPTH_TEST);
      gl.depthFunc(gl.LEQUAL);
      gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
    } else {
      return this.running = false;
    }
    fScript = document.getElementById('shader-fs').textContent;
    vScript = document.getElementById('shader-vs').textContent;
    glUtils.addProgram(this.basicProgram, new GLProgram(vScript, fScript));
    glUtils.useProgram(this.basicProgram);
    this.worldCam = new Camera2D();
    this.worldCam.lookAt(0, 0);
    this.worldCam.setBounds(-1, 1, -1, 1);
    this.triangle = new TriangleTest();
    return this.initialized = true;
  };

  Engine.prototype.update = function(elapsed) {
    return document.getElementById('text').textContent = elapsed;
  };

  return Engine;

})();

e = new Engine();