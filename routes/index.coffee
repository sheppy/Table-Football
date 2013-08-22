Player = require "../models/player"

module.exports = (app) ->

    # GET home page.
    app.get "/", (req, res, next) ->
        Player
            .find()
            .sort("name")
            .lean()
            .exec (err, players) ->
                if err then next(err)

                res.render("index", {
                    title: "Table Football",
                    players: players
                })