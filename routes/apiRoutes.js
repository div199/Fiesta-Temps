var sessionUtils = require('./../services/sessionUtils');
var Constants = require('./../constants');
var config = require('./../config');
var databaseUtils = require('./../services/databaseUtils');
var redisUtils = require('./../services/redisUtils');
var util = require('util');


module.exports={

	showMyBookings: function* (next){
		
		var queryString = " Select * from hallbooking,hall,resort where hallbooking.hallid=hall.hallid and hall.rid=resort.rid and hallbooking.uid='%s'";
		var query=util.format(queryString,this.params.uid);
        var hall_bookings = yield databaseUtils.executeQuery(query);
        yield this.body=hall_bookings;
        });
    },


    getMyBooking: function* (next){
		
		var queryString = " Select * from hallbooking,hall,resort where hallbooking.hallid=hall.hallid and hall.rid=resort.rid and hallbooking.uid='%s' and hallbooking.bookingid='%s'";
		var query=util.format(queryString,this.params.uid,this.params.bookingid);
        var booking = yield databaseUtils.executeQuery(query);
        yield this.body=booking;
        	
    },
showMyResort: function* (next){
		var queryString = '';
        var query = '';
        var date = this.request.query.date;
        if(date){
            queryString = "Select * from hallbooking,hall,resort,user where hallbooking.hallid=hall.hallid and hall.rid=resort.rid and resort.uid=user.uid and hall.rid='%s' and DATE(funcstart)=DATE('%s')";
            query = util.format(queryString,this.params.rid,date);
            console.log(query);
            var booking_details_on_date = yield databaseUtils.executeQuery(query);
            yield this.body=booking_details_on_date;
        }
        else{
    		 queryString = "Select * from hallbooking,hall,resort,user where hallbooking.hallid=hall.hallid and hall.rid=resort.rid and resort.uid=user.uid and hall.rid='%s'";
    		 query = util.format(queryString,this.params.rid);
            var results = yield databaseUtils.executeQuery(query);
            yield this.body=results;
        } 
    },

  
    
    confirmation:function* (){
    	var queryString=" select * from user,resort,hall,hallbooking where user.uid=hallbooking.uid and hallbooking.hallid=hall.hallid and hall.rid=resort.rid and user.uid=2";  	
var confo = yield databaseUtils.executeQuery(queryString);
        yield this.body=confo;
    }
/*showmyresortbydate: function* (){
		var queryString = "Select * from hallbooking where rid='%s'";
		var query=util.format(queryString,this.params.rid);
        var results = yield databaseUtils.executeQuery(query);
        this.body=results;
}*/

listWithLocation:function* (next){
        var location=this.request.query.location;
    if(location){
    var queryString="Select * from resort where loc='%s'";
    var query=util.format(queryString,location);
    var list=yield databaseUtils.executeQuery(query);
     yield this.render('listlocation',{
        	bookings : list
        });	}
     else
     {
        yield this.render('err');
     }
    },

	showAllUsers: function*(next){
		var queryString="Select * from user,role,userrole where user.uid=role.uid and role.roleid=userrole.roleid";
		var results=yield databaseUtils.executeQuery(queryString);
		yield this.body=results;
		},
	showAllResorts: function*(next){
		var queryString="Select * from resort";
		var results=yield databaseUtils.executeQuery(queryString);
		yield this.body=results;
	},
	showResort: function*(next){
		var rid=this.params.rid;
		var queryString="Select * from resort,hall where hall.rid=resort.rid and resort.rid=%s";
		var query=util.format(queryString,rid);
		var results=yield databaseUtils.executeQuery(query);
		yield this.body=results;
	},
	addResortPage: function*(next){
		yield this.render('newResortForm');
	}
}

	