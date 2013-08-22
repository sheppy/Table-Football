fs = require "fs"
routes = require "../routes"

module.exports = (app) ->
    # Load all of our routes
    fs.readdirSync(__dirname + "/../routes").forEach (filename) =>
        require("../routes/" + filename)(app)