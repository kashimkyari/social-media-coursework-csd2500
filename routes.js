'use strict';

require('dotenv').config({ silent: true });



const bodyParser = require('body-parser');
var express = require('express');
var router = express();
var upload = require("express-fileupload");
var AssistantV2 = require('ibm-watson/assistant/v2'); // watson sdk
const { IamAuthenticator, BearerTokenAuthenticator } = require('ibm-watson/auth');

var dbHandler = require('./dbHandler');

router.use(upload());
router.use(bodyParser.json());
router.use(bodyParser.urlencoded({ extended: true }));

// AUTH
router.get('/checkLogin', function (req, res) {
    dbHandler.checkAuth(req, res);
});

// Get Posts and its comments
router.get('/getPosts', function (req, res) {
    dbHandler.getPosts(req, res);
});

// Get Comments
router.get('/getComments', function (req, res) {
    dbHandler.getComments(req, res);
});

// User Registration
router.post('/register', function (req, res) {
    dbHandler.register(req, res);
});





module.exports = router;
