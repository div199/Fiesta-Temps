var sessionUtils = require('./../services/sessionUtils');
var Constants = require('./../constants');
var config = require('./../config');
var databaseUtils = require('./../services/databaseUtils');
var redisUtils = require('./../services/redisUtils');
var util = require('util');


function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
}

module.exports={

	showMyBookings: function* (next){
		
		var queryString,query,results,cancelResults,previousResults;
        var role=this.params.role;
        
    if(this.currentUser){
        if(role==Constants.UserConstants.USER_ROLENAME){
 queryString='select resort.*,hall.*,hallbooking.*,us.* from user join resort join hall join hallbooking join user us on user.uid=hallbooking.uid and resort.rid=hall.rid and hall.hallid=hallbooking.hallid and us.uid=resort.uid where user.uid=%s and expirydate>current_timestamp and cancel=0 and funcstart>current_timestamp order by ctimestamp desc';
 query=util.format(queryString,this.currentUser.uid);
 results=yield databaseUtils.executeQuery(query);
 

 queryString="select resort.*,hall.*,hallbooking.*,us.* from user join resort join hall join hallbooking join user us on user.uid=hallbooking.uid and resort.rid=hall.rid and hall.hallid=hallbooking.hallid and us.uid=resort.uid where user.uid=%s and (expirydate<current_timestamp or cancel=1) order by ctimestamp desc";
 query=util.format(queryString,this.currentUser.uid);
 cancelResults=yield databaseUtils.executeQuery(query);

 queryString='select resort.*,hall.*,hallbooking.*,us.* from user join resort join hall join hallbooking join user us on user.uid=hallbooking.uid and resort.rid=hall.rid and hall.hallid=hallbooking.hallid and us.uid=resort.uid where user.uid=%s and funcstart<current_timestamp order by ctimestamp desc';
 query=util.format(queryString,this.currentUser.uid);
 previousResults=yield databaseUtils.executeQuery(query);
 
}
else if(role==Constants.UserConstants.OWNER_ROLENAME){
    queryString=" select h.*,r.*,hb.*,us.* from resort r join user u join hall h join hallbooking hb join user us on r.uid=u.uid and r.rid=h.rid and hb.hallid=h.hallid and hb.uid=us.uid  and u.uid='%s' and expirydate>current_timestamp and cancel=0 order by ctimestamp";
    query=util.format(queryString,this.currentUser.uid);
    results=yield databaseUtils.executeQuery(query);

    queryString="select h.*,r.*,hb.*,us.* from resort r join user u join hall h join hallbooking hb join user us on r.uid=u.uid and r.rid=h.rid and hb.hallid=h.hallid and hb.uid=us.uid  and u.uid='%s' and (expirydate<current_timestamp or cancel=1) order by ctimestamp desc";
    query=util.format(queryString,this.currentUser.uid);
    cancelResults=yield databaseUtils.executeQuery(query);
    
    queryString=" select h.*,r.*,hb.*,us.* from resort r join user u join hall h join hallbooking hb join user us on r.uid=u.uid and r.rid=h.rid and hb.hallid=h.hallid and hb.uid=us.uid  and u.uid='%s' and funcstart>current_timestamp order by ctimestamp desc";
    query=util.format(queryString,this.currentUser.uid);
    previousResults=yield databaseUtils.executeQuery(query);
    
}
}


yield this.render('userBookings',{
    bookings:results,
    role:role,
    cancelled:cancelResults,
    previous:previousResults,
    errorMessage:null
});
    },

    
    
  showResortByName: function*(next){
        var rid=this.params.rid;
        var queryString="select * from resort where rid='%s'";
        var query=util.format(queryString,rid);
        var results=yield databaseUtils.executeQuery(query);
        results[0].tagline=results[0].tagline.replace(/\^/g,"'");
        results[0].resortaddress=results[0].resortaddress.replace(/\^/g,"'");
        results[0].description=results[0].description.replace(/\^/g,"'");
        results[0].termsconditions=results[0].termsconditions.replace(/\^/g,"'");
        
        
         var date=this.request.query.date;
         if(!date){
            
         var queryString1="select * from hall join media on hall.hallid=media.hallid where rid='%s' and  hall.hallid not  IN(select hallbooking.hallid from hall join hallbooking on hall.hallid=hallbooking.hallid  where rid='%s' and confirm=1 and DATE(funcstart)=DATE(now()));";
        var query1=util.format(queryString1,rid,rid);
         var hallresult=yield databaseUtils.executeQuery(query1); 
         date=formatDate(new Date());
     }
      else{

      var queryString1="select * from hall join media on hall.hallid=media.hallid where rid='%s' and  hall.hallid not  IN(select hallbooking.hallid from hall join hallbooking on hall.hallid=hallbooking.hallid  where rid='%s' and confirm=1 and DATE(funcstart)=DATE('%s'));";
        var query1=util.format(queryString1,rid,rid,date);
        
         var hallresult=yield databaseUtils.executeQuery(query1); 


      }
   


      var queryString1="  select * from (select distinct r.*,m.* from (resort r join hall h on r.rid=h.rid) join media m on m.hallid=h.hallid where r.rid='%s' order by field (m.type,'other','video','image') desc)as medresorts ";
        var query1=util.format(queryString1,rid);
         var mediaresult=yield databaseUtils.executeQuery(query1); 
         




        yield this.render('resort',{
            bookings:results,
            hallinfo:hallresult,
            mediaresult:mediaresult,
            dt:date
        });
    },

showMyResort: function* (next){
		var queryString = '';
        var query = '';
        var date = this.request.query.date;
        var rid=this.params.rid;
       // if(1){
            queryString = " select * from hall join media on hall.hallid=media.hallid where rid='%s' and  hall.hallid not  IN(select hallbooking.hallid from hall join hallbooking on hall.hallid=hallbooking.hallid  where rid='%s' and confirm=1 and expirydate>current_timestamp and DATE(funcstart)=DATE('%s')) and media.type='image' group by hall.hallid";
            query = util.format(queryString,rid,rid,date);
             
            var booking_details_on_date = yield databaseUtils.executeQuery(query);
           
            yield this.render('showresort',{
                bookings : booking_details_on_date
            });
      
    },

  
    
    showConfirmPage:function* (){
        redisUtils.setItem(Constants.redisDataKeys.PREVIOUS_URL,this.request.header.referer);

        var startTime=this.request.body.startTime;
        var endTime=this.request.body.endTime;
        var date=this.request.body.datetobook;
        var hall=this.request.body.hallid;
        
        
        var queryString=" select * from hall h join resort r on h.rid=r.rid where hallid='%s'";
        var query=util.format(queryString,hall);
        var results=yield databaseUtils.executeQuery(query);
    	yield this.render('confirmMyBooking',{
            startTime:startTime,
            endTime:endTime,
            date:date,
            bookings:results
        });
    },
    bookNewBooking: function*(next){

        var username=this.request.body.username;
        var mobile=this.request.body.mobile;
        var mail=this.request.body.usrmail;
        var usraddr=this.request.body.usraddress.replace(/'/g,"^");
        var rid=this.request.body.rid;
        var hallid=this.request.body.hallid;
        var capacity=this.request.body.capacity;
        var cost=this.request.body.cost;
        var loc=this.request.body.loc;
        var date=this.request.body.date;
        var startTime=this.request.body.startTime;
        var endTime=this.request.body.endTime;
        

        var queryString="Select * from hallbooking where date(funcstart)=date('%s') and hallid='%s' and hold=1 and expirydate>current_timestamp";
        var query=util.format(queryString,date,hallid);
        var results=yield databaseUtils.executeQuery(query);

        queryString="Select * from user where mail='%s'";
        query=util.format(queryString,mail);
        var user=yield databaseUtils.executeQuery(query);

        if(user.length==0){
            queryString="Insert into user (name,mno,mail,useraddress,password) values ('%s','%s','%s','%s','')";
            query=util.format(queryString,username,mobile,mail,usraddr);
            yield databaseUtils.executeQuery(query);

        queryString="Select * from user where mail='%s'";
        query=util.format(queryString,mail);
        user=yield databaseUtils.executeQuery(query);
        }

        queryString="Insert into hallbooking (uid,hallid,hold,counttowait,cancel,confirm,expirydate,funcstart,funcenddate) values ('%s','%s',1,'%s',0,0,date_add(current_timestamp,interval 3 hour),concat(date('%s'),' ',str_to_date('%s','%l:%i %p')),concat(date('%s'),' ',str_to_date('%s','%l:%i %p')))";
        query=util.format(queryString,user[0].uid,hallid,results.length,date,startTime,date,endTime);
        yield databaseUtils.executeQuery(query);

        if((this.currentUser.roleid==Constants.UserConstants.USER_ROLEID) || (this.currentUser.roleid==Constants.UserConstants.OWNER_ROLEID && this.currentUser.uid==user[0].uid))//customer
        {
            this.redirect('/app/user/bookings');
        }
        else if(this.currentUser.roleid==Constants.UserConstants.OWNER_ROLEID && this.currentUser.uid!=user[0].uid){
            this.redirect('/app/resort/bookings');
        }

    },
    cancelMyBooking : function*(next){
        var role=this.params.role;
        var booking=this.params.bookingid;
        
        var queryString="select hb.uid as user,u.uid as owner,hb.bookingid,hold,cancel,confirm,counttowait,hb.hallid,expirydate,funcstart,funcenddate from hallbooking hb join hall h join resort r join user u on hb.hallid=h.hallid and r.rid=h.rid and r.uid=u.uid where bookingid='%s'";
        var query=util.format(queryString,booking);
        var result=yield databaseUtils.executeQuery(query);
        console.log(result);
        
        if(role=='user' && this.currentUser.uid==result[0].user){
            
            queryString="update hallbooking set counttowait=counttowait-1 where hallid='%s' and date(funcstart)=date('%s') and expirydate>current_timestamp and hold=1 and counttowait>'%s' and bookingid!='%s'";
            query=util.format(queryString,result[0].hallid,formatDate(result[0].funcstart),result[0].counttowait,booking);
            console.log(query);
            yield databaseUtils.executeQuery(query);

            queryString="update hallbooking set cancel=1,confirm=0,hold=0,counttowait=0,cancelbyuser=1 where bookingid='%s'";
            query=util.format(queryString,booking);
            console.log(query);
            yield databaseUtils.executeQuery(query);


            this.redirect('/app/user/bookings');
        
        }
         if(role=='resort' && this.currentUser.uid==result[0].owner){
            

            queryString="update hallbooking set counttowait=counttowait-1 where hallid='%s' and date(funcstart)=date('%s') and expirydate>current_timestamp and hold=1 and counttowait>'%s' and bookingid!='%s'";
            query=util.format(queryString,result[0].hallid,formatDate(result[0].funcstart),result[0].counttowait,booking);
            yield databaseUtils.executeQuery(query);

            queryString="update hallbooking set cancel=1,confirm=0,hold=0,counttowait=0,cancelbyowner=1 where bookingid='%s'";
            query=util.format(queryString,booking);
            yield databaseUtils.executeQuery(query);

           this.redirect('/app/resort/bookings');
        }
        else{
             errorMessage=Constants.ErrorMessage.INVALID_USER;
            yield this.render('userBookings',{
                errorMessage:errorMessage,
                bookings:null,
                role:null,
                cancelled:null,
                previous:null
            });
        }
    },
    confirmMyBooking : function*(next){
        var role=this.params.role;
        var booking=this.params.bookingid;
        

        var queryString="select hb.uid as user,u.uid as owner,hb.bookingid,hold,cancel,confirm,counttowait,hb.hallid,expirydate,funcstart,funcenddate from hallbooking hb join hall h join resort r join user u on hb.hallid=h.hallid and r.rid=h.rid and r.uid=u.uid where bookingid='%s'";
        var query=util.format(queryString,booking);
        var result=yield databaseUtils.executeQuery(query);
        
        if(this.currentUser.uid==result[0].owner){
            

           
            queryString="update hallbooking set cancel=1,confirm=0,hold=0,counttowait=0,cancelbyowner=1 where hallid='%s' and date(funcstart)=date('%s') and expirydate>now() and hold=1 and bookingid!='%s'";
            query=util.format(queryString,result[0].hallid,formatDate(result[0].funcstart),booking);
            
            var see=yield databaseUtils.executeQuery(query);
            
            

             queryString="update hallbooking set cancel=0,confirm=1,hold=0,counttowait=0 where bookingid='%s'";
            query=util.format(queryString,booking);
            yield databaseUtils.executeQuery(query);
           
            


            this.redirect('/app/resort/bookings');
        }
    }

}

	