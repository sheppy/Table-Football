module.exports = (app) ->

    # GET home page.
    app.get "/", (req, res) ->
        res.render("index", { title: "Table Football" })