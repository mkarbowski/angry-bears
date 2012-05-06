class ResourceDepot

  @path

  init = ->
    @path = "resources/"

  getJSON = (file, callback) ->
    request = new XMLHttpRequest();
    request.open "GET", file, true
    if request.overrideMimeType
      request.overrideMimeType 'application/json'

    request.onreadystatechange = ->
      if request.readyState == 4
        if request.status == 404
          console.log "ERROR: file '{# file}' does not exist!"
        else
          callback request.responseText
    request.send()

resourceDepot = new ResourceDepot()
resourceDepot.init()