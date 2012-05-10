class Sprite
  constructor: (spriteXML) ->
    @animations = undefined
    @mesh = undefined
    @currentAnimation = undefined

    vertTag = spriteXML.childNodes[0]
    vertCoords = vertTag.childNodes
    
    texTag = sprite.childNodes[1]
    texCoords = texTag.childNodes
    
    vert = []
    tex = []

    for coord in vertCoords
      sArr = coord.innerText.split ','
      vert.push parseInt sArr[0]
      vert.push parseInt sArr[1]
      vert.push parseInt sArr[2]

    for coord in texCoords
      sArr = coord.innerText.split ','
      tex.push parseInt sArr[0]
      tex.push parseInt sArr[1]

    @mesh = new Mesh vert, tex

    animTag = dom.getElementsByTagName('Animations')[0]
    anims = animTag.childNodes
    for anim in anims
      name = anim.childNodes[0].innerText
      frameCount = parseInt anim.childNodes[1].innerText
      resources = []
      for file in anim.childNodes[2].childNodes
        resources.push file.innerText
      @animations[name] = new Animation frameCount, resources    
    return null

  setAnimation: (name) ->
    @currentAnimation.reset()
    @currentAnimation = @animations[name]

  draw: (camera, model) ->
    glUtils.useCamera camera, model
    glUtils.useTexture @currentAnimation.texture()
    glUtils.setTextureBuffer @mesh.textureBuffer, 0, 0
    glUtils.setVertexBuffer @mesh.vertexBuffer, 0, 0
    gl.drawArrays gl.TRIANGLES, 0, @mesh.size

  load: ->
    @mesh.load()
    for prop in @animations
      if @animations.hasOwnProperty prop and prop is GLTexture then prop.load()

  unload: ->
    @mesh.unload()
    for prop in @animations
      if @animations.hasOwnProperty prop and prop is GLTexture then prop.unload()