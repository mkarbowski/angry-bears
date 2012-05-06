class Action
  #the number of frames required to complete the action
  @frameCounts
  #array of hitboxes
  @selfHitboxes
  #array of hitboxes
  @attackHitboxes
  #array of textures
  @textures
  #conditions necessary to trigger Action
  @triggerConditions
  #condition necessary to interrupt
  @interruptConditions
  #actions taken on interrupt
  @interruptActions
  #actions taken on completion
  @endActions
  #boolean for hostility
  @isHostile