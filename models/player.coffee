mongoose = require "mongoose"

playerSchema = mongoose.Schema {
    name:
        type: String
        required: true
        trim: true
    email:
        type: String
        required: true
        trim: true
        index:
            unique: true
}

module.exports = mongoose.model "Player", playerSchema