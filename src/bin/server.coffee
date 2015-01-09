restify = require('restify')

server = restify.createServer
  name: 'hello-world'
  version: '1.0.0'

server.use restify.acceptParser(server.acceptable)
server.use restify.queryParser()
server.use restify.bodyParser()

server.get '/hello/:name', (req, res, next) ->
  res.send {hello: req.params}
  next()

server.listen (process.env.PORT or 3000), ->
  console.log "%s listening at %s", server.name, server.url
