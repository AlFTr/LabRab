const express = require('express')
const bodyParser = require('body-parser')
var cookieParser = require('cookie-parser')


const app = express()
app.use(cookieParser());
app.use(bodyParser.urlencoded({extended: true}))
app.use(bodyParser.json())
var path = require('path');
app.use(express.static(path.join(__dirname, 'public')));
app.get('/hack', function(req, res){
    res.sendfile(__dirname + '/public/html/index.html');
})
//get получаем страницу добавления пользователя
app.get('/add', function(req, res){
    res.sendfile(__dirname + '/public/html/add.html');
})
//post пользователь добавляется
app.get('/addUser', function(req, res)
{
    var us =  req.cookies["users"]
    us += req.query.id+"$"+req.query.name+"@";
    res.cookie("users", us)
    res.json({
        message : "Пользователь добавлен"
    })
})

app.post("/users", function(req,res)
{
    var users = req.cookies["users"]
   
      var arr = req.cookies["users"].toString().split("@")
       var result = []
      arr.forEach(element => {
          var data = element.split("$")
          result.push("Id - "+data[0]+ " name - "+data[1])
      });
      res.json({
          users : result
      })
})
app.delete("/delete", function(req, res)
{
    res.cookie("users", "")
    res.json({
        message :"Список пользователей очищен"
    })
})
app.put("/search", function(req, res)
{
    var id = req.body.id
    var users = req.cookies["users"].toString().split("@")
    var ress = "not found";
    users.forEach(element => {
        var data = element.split("$")
        if(data[0] == id)
            ress = data[1];
    });
    res.json({users: ress})
})
app.options("/option", function(req, res)
{
    res.json({
        "app name": "test application",
        "methods using": "post get delete option put",
        "project version" : "1.0"
    })
})

module.exports = app