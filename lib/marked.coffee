marked  = require("marked")

exports.init = ->
  marked = marked.setOptions
    sanitize: true

  return marked
