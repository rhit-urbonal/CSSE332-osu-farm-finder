var express = require('express')
var app = express()
var path = require('path')
var http = require('http')

var relpath = path.relative('/','public/index.html')

app.use(express.static(__dirname + '/public'));

app.get('/mdb-ui-kit/mdb.min.css', (req, res) => {
    res.sendFile(__dirname + '/node_modules/mdb-ui-kit/css/mdb.min.css')
})

app.get('/', (req, res) => {
    res.sendFile('index.html')
})

app.listen('3000')