var express = require('express');
var bParser = require('body-parser');

var app = express(); // create web server

app.use(bParser.json()); //для парс json котор передали в body
app.use(bParser.urlencoded({extended: true})); //для того чтобы правильно парсить данные формы

// логирование
var expressLogging = require('express-logging'),
	logger = require('logops');
app.use(expressLogging(logger));

app.use(express.static(__dirname + "/static"));

var DATA = [

	{id: 1, name: 'firefly'},
	{id: 2, name: 'mushroom'},
	{id: 3, name: 'airplane'}
];
 
 		// requestbody запись то что мы передали
 		//Роут приложения 
//Main Page
app.get('./static/index.html', function (req, res) {
	//res.send(DATA);
	logger.info('GET request static Page');
});

// получение GET запроса на главную страницу
app.get('/DATA', function (req, res) {
  res.send(DATA);
//  res.send('Got a Get request');
  logger.info('GET request');
});
app.get('/DATA/:id', function (req, res) {
  var D = DATA.find(function (D){
  	return D.id === Number(req.params.id)
  });
  res.send(D);
});
			//добавление данных и сохранение в ram
// получение POST запроса на главную страницу
app.post('/DATA', function (req, res) {
  var D = {id: Date.now(), name: req.body.name};
  DATA.push(D);
  res.send(D);
  res.send('Got a POST request');
  logger.info('POST request');
});
 
// получение PUT запроса по адресу /user
app.put('/DATA/:id', function (req, res) {
	var D = DATA.find(function (D){
  	return D.id === Number(req.params.id)
  });
	D.name = req.body.name; //обновить имя
	res.send(D);
  res.send('Got a PUT request at /DATA');
  logger.info('PUT request');
});
 
// получение DELETE запроса по адресу /user
app.delete('/DATA/:id', function (req, res) {
	DATA = DATA.filter(function (D)
	{
		return D.id !== Number(req.params.id);
	})
	res.sendStatus(200);
  res.send('Got a DELETE request at /DATA');
  logger.info('DELETE request');
});
 
var server = app.listen(8082, function () {
     var host = server.address().address
     var port = server.address().port
     console.log('\nServer started!','localhost',host,port)
});
