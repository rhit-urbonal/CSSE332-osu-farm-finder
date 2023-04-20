const express = require('express')
const app = express()
const mysql = require('mysql')

app.use(express.static(__dirname + '/public'));

app.get('/', (req, res) => {
    res.sendFile('index.html')
})

var con = mysql.createConnection({
    host: "localhost:3000",
    user: "",
    password: "",
    database: "titan.csse.rose-hulman.edu"
})

app.listen('3000')