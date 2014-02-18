var express = require('express');
var fs = require('fs');
var postmark = require("postmark")(process.env.POSTMARK_API_KEY);
var swig = require('swig');


var app = express(express.logger());

app.use(express.bodyParser());
app.engine('html', swig.renderFile);
app.set('view engine', 'html');
app.set('views', __dirname + '/');

app.get('/', function(request, response) {
  response.render('index', { pagename: 'quilombola traders' });
});

app.post('/contact', function(request, response) {
  var name = request.body.name;
  var email = request.body.email;
  var comments = request.body.comments;
  var out = "contact name: " + name + "\tcontact email: " + email + "\tcomments: " + comments + "\n";
  postmark.send({
    "From": "munair@quilombola.com",
    "To": "info@quilombola.com",
    "Subject": "Quilombola Information Request",
    "TextBody": out,
    "Tag": "registrant"
  }, function(error, success) {
       if(error) {
          console.error("Unable to send via postmark: " + error.message);
         return;
       }
    console.info("Sent to postmark for delivery")
  });

  response.render('contact', { pagename: 'quilombola traders' });
});

var port = process.env.PORT || 8080;
app.listen(port, function() {
  console.log("Listening on " + port);
});
