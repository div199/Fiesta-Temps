var config = require('./../config');
var logger = require('./../logger');
var crypto = require('crypto');
var encryption_key = "edf31";

module.exports = {
    decrypt: function(inputString) {
        var decipher = crypto.createDecipher('aes-128-ecb', encryption_key);
        var chunks = [];
        var encryptedData =  new Buffer(inputString, "base64").toString("binary");
        chunks.push( decipher.update(encryptedData, 'binary', 'utf8'));
        chunks.push( decipher.final('utf8') );
        var decodedString = chunks.join("");
        decodedString = new Buffer(decodedString, "binary").toString("utf-8");
        return decodedString;
    }
};


/*

var crypto = require('crypto');
var encryption_key = "edf31";
//var fullBuffer = "H+M4Kv6bUHIFPO1qvWL9hQ==";
var fullBuffer = "v6v2TOy1DX0BqbFRxejP3mcR9+GFuSzr9/m1CgTonW4=";

var decipher = crypto.createDecipher('aes-128-ecb', encryption_key);

chunks = [];
var encryptedData =  new Buffer(fullBuffer, "base64").toString("binary");
chunks.push( decipher.update(encryptedData, 'binary', 'utf8'));
chunks.push( decipher.final('utf8') );
var txt = chunks.join("");
txt = new Buffer(txt, "binary").toString("utf-8");
console.log(txt);
*/
