class Sprite
  constructor: (spriteXML) ->
    @animations = new Object()
    @mesh = null
    @currentAnimation = null

    vertTag = spriteXML.childNodes[1]
    vertCoords = vertTag.childNodes
    
    texTag = spriteXML.childNodes[3]
    texCoords = texTag.childNodes
    
    vert = []
    tex = []

    for coord in vertCoords
      if coord.localName == 'Coord'
        sArr = coord.firstChild.data.split ','
        vert.push parseInt sArr[0]
        vert.push parseInt sArr[1]
        vert.push parseInt sArr[2]
    vert = new Float32Array vert

    for coord in texCoords
      if coord.localName == 'Coord'
        sArr = coord.firstChild.data.split ','
        tex.push parseInt sArr[0]
        tex.push parseInt sArr[1]
    tex = new Float32Array tex

    @mesh = new Mesh vert, tex

    animTag = spriteXML.childNodes[5]
    anims = animTag.childNodes
    for anim in anims
      if anim.localName == 'Animation'
        name = anim.childNodes[1].firstChild.data
        frameCount = parseInt anim.childNodes[3].firstChild.data
        resources = []
        for file in anim.childNodes[5].childNodes
          if file.localName == 'File'
            resources.push file.firstChild.data
        @animations[name] = new Animation frameCount, resources    
    return null

  setAnimation: (name) ->
    if @currentAnimation?
      @currentAnimation.reset()
    @currentAnimation = @animations[name]

  draw: (camera, model) ->
    glUtils.useCamera camera, model
    glUtils.useTexture @currentAnimation.texture()
    glUtils.setTextureBuffer @mesh.texBuffer, 0, 0
    glUtils.setVertexBuffer @mesh.vertBuffer, 0, 0
    gl.drawArrays gl.TRIANGLES, 0, @mesh.size

  load: ->
    @mesh.load()
    `for (var prop in this.animations) {
      if (this.animations.hasOwnProperty(prop)) {
        this.animations[prop].load();
      }
    }`
    return null

  unload: ->
    @mesh.unload()
    for prop in @animations
      if @animations.hasOwnProperty prop and prop is GLTexture then prop.unload()
    return null