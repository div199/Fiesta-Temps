var sessionUtils = require('./../services/sessionUtils');
var Constants = require('./../constants');
var config = require('./../config');
var databaseUtils = require('./../services/databaseUtils');
var redisUtils = require('./../services/redisUtils');
var util = require('util');


module.exports={

  listWithLocation:function* (next){
        
    var queryString="Select * from resort where loc='mathura'";
    
    var list=yield databaseUtils.executeQuery(queryString);
     yield this.render('SearchByLocation',{
        	bookings : list
        });	},

     showSearchByDatePage: function*(next){
        yield this.render('SearchByDate',{
            bookings:null,
            date:null
        });
     },

     searchByDate:function* (next){
        var date=this.request.body.searchdate;
    
    var queryString="select * from (select distinct r.*,m.* from (resort r join hall h on r.rid=h.rid) left join media m on m.hallid=h.hallid where h.hallid not in(select distinct h.hallid from hallbooking hb join hall h on h.hallid=hb.hallid where date(funcstart)=date('%s') and hb.expirydate>current_timestamp and confirm=1) and remove=0 order by field(m.type,'other','video','image') desc) as medresorts group by medresorts.rid;";
    var query=util.format(queryString,date);
    var list=yield databaseUtils.executeQuery(query);
    
     yield this.render('SearchByDate',{
            bookings : list,
            date:date
        });
    },
    showSearchByVenuePage : function*(next){
        yield this.render('SearchByVenue',{
            bookings:null
        });
    },


     searchByVenue:function* (next){


        var ResortName=this.request.body.rname;

    
    var queryString=" select * from (select distinct r.*,m.* from (resort r join hall h on r.rid=h.rid) left join media m on m.hallid=h.hallid where r.rname like '%"+ResortName+"%' and r.remove=0 order by field (m.type,'other','video','image') desc)as medresorts group by medresorts.rid";
    var query=util.format(queryString);
    var list=yield databaseUtils.executeQuery(query);

     yield this.render('SearchByVenue',{
        	bookings : list
        });	}









}