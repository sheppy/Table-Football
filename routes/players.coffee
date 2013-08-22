Player = require "../models/player"

module.exports = (app) ->

    app.get "/players", (req, res, next) ->
        Player
            .find()
            .sort("name")
            .lean()
            .exec (err, players) ->
                if err then next(err)

                res.render "players", {
                    title: "Players : Table Football",
                    players: players
                }

    app.get "/players/add", (req, res) ->
        res.render "players/add", {
            title: "Add Player : Table Football"
        }

    app.post "/players/add", (req, res, next) ->
        player = new Player {
            name: req.body.name
            email: req.body.email
        }

        player.save (err) ->
            unless err
                res.redirect "/players"
            else
                res.render "players/add", {
                    title: "Add Player : Table Football",
                    player: player,
                    error: true
                }
