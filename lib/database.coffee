mongoose = require "mongoose"

dbURI = "mongodb://localhost:27017/table-football"

mongoose.connect dbURI, {server: {auto_reconnect: true}}
