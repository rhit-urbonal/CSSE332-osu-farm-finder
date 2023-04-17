var express = require('express')
var app = express()
var path = require('path')
var http = require('http')

var relpath = path.relative('/','public/index.html')

app.get('/', (req, res) => {
    res.sendFile(__dirname + '/public/index.html')
})

app.listen('3000')