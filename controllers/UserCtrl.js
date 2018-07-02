var sessionUtils = require('./../services/sessionUtils');
var Constants = require('./../constants');
var config = require('./../config');
var databaseUtils = require('./../services/databaseUtils');
var redisUtils = require('./../services/redisUtils');
var util = require('util');


module.exports = {

login: function* (next) {
        var email = this.request.body.email;
        var password = this.request.body.password;
          
        var queryString = " select u.*,r.* from user u join (role r join userrole ur on r.roleid=ur.roleid) on u.uid=ur.uid where u.mail='%s' and u.password='%s' and u.remove=0";
        var query = util.format(queryString, email, password);
        
        var results = yield databaseUtils.executeQuery(query);
        var splt=this.request.header.referer.split('app/');

        if(splt[1]=='confirmmybooking'){
            
            this.request.header.referer=yield redisUtils.getItem(Constants.redisDataKeys.PREVIOUS_URL);
        }
        
        var errorMessage;
        if(results.length == 0) {
            errorMessage = Constants.ErrorMessage.INVALID_USER_CREDENTIALS;
            yield this.render('home', {
                errorMessage: errorMessage,
                trending:null,
                gallery:null
            });
        } else {
        	
            var redirectUrl = "/app/home";
            sessionUtils.saveUserInSession(results[0], this.cookies);
            this.redirect(this.request.header.referer);
          
            
        }
    },
     signup: function* (next) {
       var name=this.request.body.fname+" "+this.request.body.lname;
    
    var addr=this.request.body.addr;
    var loc=this.request.body.loc;
    var mno=this.request.body.mno;
    var mail=this.request.body.mail;
    var password=this.request.body.passsignup;
    
    var queryString="Select * from user where mail='%s'";
    var query=util.format(queryString,mail);
    var results=yield databaseUtils.executeQuery(query);
    
    var errorMessage=Constants.ErrorMessage.ALREADY_USER;
    if(results.length==1){
        yield this.render('home',{
            errorMessage:errorMessage,
            trending:null,
            gallery:null
        });
    }
    else{
        queryString="insert into user (name,useraddress,city,mno,mail,password,remove) values('%s','%s','%s','%s','%s','%s',0)";
        query=util.format(queryString,name,addr,loc,mno,mail,password);
       var result= yield databaseUtils.executeQuery(query);
        
        
        queryString="Insert into userrole (uid,roleid) values ('%s',1)";
        query=util.format(queryString,result.insertId);
        yield databaseUtils.executeQuery(query);
        queryString="select u.*,r.* from user u join (role r join userrole ur on r.roleid=ur.roleid) on u.uid=ur.uid where u.mail='%s' and u.password='%s' and u.remove=0";
        query=util.format(queryString,mail,password);
        var user=yield databaseUtils.executeQuery(query);
        
        
       var redirectUrl = "/app/home";
            sessionUtils.saveUserInSession(user[0], this.cookies);
            this.redirect(redirectUrl);

    }



},

    logout: function* () {
        var sessionId = this.cookies.get("SESSION_ID");
        if(sessionId) {
            sessionUtils.deleteSession(sessionId);
        }
        
        this.cookies.set("SESSION_ID", '', {expires: new Date(1), path: '/'});
        this.redirect('/app/home');
    }
}
