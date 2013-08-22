# Module dependencies.

express = require "express"
routes = require "./routes"
http = require "http"
path = require "path"
stylus = require "stylus"

app = express()

# All environments
app.set "port", process.env.PORT || 3000
app.set "views", __dirname + "/views"
app.set "view engine", "jade"
app.use express.favicon()
app.use express.logger("dev")
app.use express.bodyParser()
app.use express.methodOverride()
app.use express.cookieParser("your secret here")
app.use express.session()
app.use app.router
app.use stylus.middleware(__dirname + "/public")
app.use express.static(path.join(__dirname, "public"))

# Development only
if "development" == app.get("env")
    app.use express.errorHandler()

# Routes
app.get("/", routes.index);

http.createServer(app).listen(app.get("port"), () ->
    console.log("Express server listening on port " + app.get("port"))
)