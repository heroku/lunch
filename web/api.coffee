coffee   = require("coffee-script")
express  = require("express")
https    = require("https")
stylus   = require("stylus")
nib      = require("nib")
qs       = require("querystring")
url      = require("url")
util     = require("util")
ohiru    = require("../lib/ohiru").init()

app = express.createServer(
  express.logger()
  express.cookieParser()
  express.bodyParser()
  stylus.middleware(
    force: true
    compile: (str, path, fn) ->
      stylus(str).set("filename", path).set("compress", true).use(nib()).import("nib")
    src:  "#{__dirname}/../stylus"
    dest: "#{__dirname}/../public")
  express.static("#{__dirname}/../public"))

app.helpers
  params: (params) ->
    require("querystring").stringify(params)

app.get "/", (req, res) ->
  ohiru.getLunch((lunch)->
    res.send(lunch)
  )

module.exports = app
