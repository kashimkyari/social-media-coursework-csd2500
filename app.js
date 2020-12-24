'use strict';

require('dotenv').config({ silent: true });


var express = require('express');
var morgan = require('morgan');
const bodyParser = require('body-parser');
var path = require('path');
var PORT = process.env.PORT || 3000
var AssistantV2 = require('ibm-watson/assistant/v2'); // watson sdk
const { IamAuthenticator, BearerTokenAuthenticator } = require('ibm-watson/auth');

var app = express();
var allRoutes = require('./routes');
var dbHandler = require('./dbHandler');

// Joining directories into one
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'views')));

// URL encoded for values in BODY during POST request
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Logs all request information and time
app.use(morgan('tiny'));

let authenticator;
if (process.env.ASSISTANT_IAM_APIKEY) {
  authenticator = new IamAuthenticator({
    apikey: process.env.ASSISTANT_IAM_APIKEY
  });
} else if (process.env.BEARER_TOKEN) {
  authenticator = new BearerTokenAuthenticator({
    bearerToken: process.env.BEARER_TOKEN
  });
}

var assistant = new AssistantV2({
  version: '2020-04-22',
  authenticator: authenticator,
  url: process.env.ASSISTANT_URL,
  disableSslVerification: process.env.DISABLE_SSL_VERIFICATION === 'true' ? true : false
});

// Endpoint to be call from the client side
app.post('/api/message', function(req, res) {
  let assistantId = process.env.ASSISTANT_ID || '<assistant-id>';
  if (!assistantId || assistantId === '<assistant-id>') {
    return res.json({
      output: {
        text:
          Hello
      },
    });
  }

  var textIn = '';

  if (req.body.input) {
    textIn = req.body.input.text;
  }

  var payload = {
    assistantId: assistantId,
    sessionId: req.body.session_id,
    input: {
      message_type: 'text',
      text: textIn,
    },
  };

  // Send the input to the assistant service
  assistant.message(payload, function(err, data) {
    if (err) {
      const status = err.code !== undefined && err.code > 0 ? err.code : 500;
      return res.status(status).json(err);
    }

    return res.json(data);
  });
});

app.get('/api/session', function(req, res) {
  assistant.createSession(
    {
      assistantId: process.env.ASSISTANT_ID || '{assistant_id}',
    },
    function(error, response) {
      if (error) {
        return res.send(error);
      } else {
        return res.send(response);
      }
    }
  );
});


// Database Connection
dbHandler.connectToDatabase();

// Routing
app.use('/', allRoutes);


app.listen(PORT, function () {
    console.log("Server started on port " + PORT + "...");
});

// setInterval(intervalFunc, 1500);
// function intervalFunc() {
//     console.log('Timer yay!');
// }
