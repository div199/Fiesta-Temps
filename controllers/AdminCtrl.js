var databaseUtils=require('./../services/databaseUtils');
var Constants = require('./../constants');
var util=require('util');
var config=require('./../config.js');

module.exports={
	showAllUsers: function*(next){
		var queryString="select * from user join userrole join role on user.uid=userrole.uid and role.roleid=userrole.roleid and user.remove!=1";
		var results=yield databaseUtils.executeQuery(queryString);
		yield this.render('allusers',{
			user:results
		});
		},
	showAllResorts: function*(next){
		var queryString="select * from (select distinct r.*,m.* from (resort r join hall h on r.rid=h.rid) left join media m on m.hallid=h.hallid where r.remove=0 order by field (m.type,'other','video','image') desc)as medresorts group by medresorts.rid";
		var results=yield databaseUtils.executeQuery(queryString);
		yield this.render('allresorts',{
			resorts:results
		});
	},/*
	showResort: function*(next){
		var rid=this.params.rid;
		var queryString="Select * from resort,hall where hall.rid=resort.rid and resort.rid=%s";
		var query=util.format(queryString,rid);
		var results=yield databaseUtils.executeQuery(query);
		yield this.render('resort',{
			resort:results
		});
	},*/
	addResortPage: function*(next){
		yield this.render('AddResort',{
      errorMessage:null
    });
	},
	addResort: function*(next){

    var resort=this.request.body.fields.Rname;
    var mnor=this.request.body.fields.MnoR;
    var mno=this.request.body.fields.Mno;
    var location=this.request.body.fields.Location;
    var address=this.request.body.fields.Address.replace(/'/g,"^");
    var oname=this.request.body.fields.Oname;
    var omail=this.request.body.fields.Omail;
    var number_of_halls=this.request.body.fields.halls_number;
    var desc=this.request.body.fields.Description.replace(/'/g,"^");
    var tc=this.request.body.fields.Conditions.replace(/'/g,"^");
    var tag=this.request.body.fields.Tagline.replace(/'/g,"^");
    var wifi=this.request.body.fields.wifi?1:0;
    var parking=this.request.body.fields.Parking?1:0;
    var ac=this.request.body.fields.AC?1:0;
    var nonveg=this.request.body.fields.NonVeg?1:0;
    var music=this.request.body.fields.Music?1:0;
    var liquor=this.request.body.fields.Liquor?1:0;
    var flower=this.request.body.fields.Flower?1:0;
    var catering=this.request.body.fields.InCatering?1:0;
    var rooms=this.request.body.fields.Rooms?1:0;


     var queryString,query;
       queryString="select * from user join role join userrole on user.uid=userrole.uid and role.roleid=userrole.roleid where mail='%s'";
       query=util.format(queryString,omail);
       var result=yield databaseUtils.executeQuery(query);

       var errorMessage;
       if (result.length==0){
         errorMessage=Constants.ErrorMessage.USER_NOT_FOUND;
        yield this.render('AddResort',{
            errorMessage:errorMessage
       });
     }
         else{
    var uid=result[0].uid;
    if(result[0].roleid==Constants.UserConstants.USER_ROLEID){
      queryString="update userrole set roleid='%s' where uid='%s'";
      query=util.format(queryString,Constants.UserConstants.OWNER_ROLEID,uid);
      yield databaseUtils.executeQuery(query);
      }

    queryString="insert into resort (rname,nhalls,loc,resortaddress,description,tagline,resortnumber,uid,wifi,parking,ac,nonveg,DJ,liquor,flowerdecor,catering,rooms,termsconditions) values('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')";
     query=util.format(queryString,resort,number_of_halls,location,address,desc,tag,mnor,uid,wifi,parking,ac,nonveg,music,liquor,flower,catering,rooms,tc);
     results=yield databaseUtils.executeQuery(query);






     for (var i=0;i<number_of_halls;i++)
     {

       var hallname=this.request.body.fields['Hname'+i];
       var capacity=this.request.body.fields['Hcap'+i];
       // var hallname=this.request.body.fields.Hname0;
       // var capacity=this.request.body.fields.Hcap0;

     var splt,filenew,path,absolutePath;
     if(number_of_halls>1){
       splt=this.request.body.files.myFile[i].path.split('\\');
       filenew=this.request.body.files.myFile[i];
        path=this.request.body.files.myFile[i].path;
     }
     else if(number_of_halls==1){
     splt=this.request.body.files.myFile.path.split('\\');
       path=this.request.body.files.myFile.path;
       filenew=this.request.body.files.myFile;
        
     }
      var imagepath=config.applicationUrl + path.substr(path.indexOf('/'));

       var type=filenew.type.split('/');
       var cost=this.request.body.fields['Hcost'+i];
        var queryString="insert into hall (rid,hname,capacity,cost) values('%s','%s','%s','%s')";
        var query=util.format(queryString,results.insertId,hallname,capacity,cost);
       var hallresults=yield databaseUtils.executeQuery(query);


        queryString="insert into media (url,hallid,type) values('%s','%s','%s')";
        query=util.format(queryString,imagepath,hallresults.insertId,type[0]);

        yield databaseUtils.executeQuery(query);

        this.redirect('/app/resort/'+results.insertId);

     }

}

	},
removeResort: function*(next){
  var resortId=this.params.rid;
  var queryString="update resort set ctimestamp=current_timestamp,remove=1 where rid='%s'";
  var query=util.format(queryString,resortId);
  yield databaseUtils.executeQuery(query);

  this.redirect('/app/admin/listresort');
},
getUpdateForm: function*(next){
var resortId=this.params.rid;
    var queryString="select * from user join resort on resort.uid=user.uid where rid='%s'";
   var query=util.format(queryString,resortId);
   var result=databaseUtils.executeQuery(query);
   console.log(result);
   result[0].resortaddress=result[0].resortaddress.replace(/\^/g,"'");
   result[0].tagline=result[0].tagline.replace(/\^/g,"'");
   result[0].termsconditions=result[0].termsconditions.replace(/\^/g,"'");
   result[0].description=result[0].description.replace(/\^/g,"'");

   yield this.render('updateResort',{
    data:result
   });
},
updateResort: function*(next){
   var rid=this.params.rid;

var resort_name=this.request.body.rname;
var resortnumber=this.request.body.resort_number;
var resort_location=this.request.body.location;
var address=this.request.body.Address.replace(/'/g,"^");
var number_of_halls=this.request.body.numberOfHalls;
var description=this.request.body.description.replace(/'/g,"^");
var tagline=this.request.body.tagline.replace(/'/g,"^");
var termsAndConditions=this.request.body.Conditions.replace(/'/g,"^");
var ownername=this.request.body.Oname;
var ownermail=this.request.body.Omail;
var ownernumber=this.request.body.mobile;
var owneradd=this.request.body.owner_Address.replace(/'/g,"^");
var wifi=this.request.body.wifi?1:0;
    var parking=this.request.body.Parking?1:0;
    var ac=this.request.body.AC?1:0;
    var nonveg=this.request.body.NonVeg?1:0;
    var music=this.request.body.Music?1:0;
    var liquor=this.request.body.Liquor?1:0;
    var flower=this.request.body.Flower?1:0;
    var catering=this.request.body.InCatering?1:0;
    var rooms=this.request.body.Rooms?1:0;

var queryString="Select * from resort where rid='%s'";
var query=util.format(queryString,rid);
var user= yield databaseUtils.executeQuery(query);

 queryString=" update resort set rname='%s',resortnumber='%s',loc='%s',resortaddress='%s',nhalls='%s',description='%s',tagline='%s',termsconditions='%s',wifi='%s',parking='%s',ac='%s',nonveg='%s',DJ='%s',liquor='%s',flowerdecor='%s',catering='%s',rooms='%s' where rid='%s'";
 query=util.format(queryString,resort_name,resortnumber,resort_location,address,number_of_halls,description,tagline,termsAndConditions,wifi,parking,ac,nonveg,music,liquor,flower,catering,rooms,rid);

var result= yield databaseUtils.executeQuery(query);


queryString="update user set name='%s',mail='%s',mno='%s',useraddress='%s' where uid='%s'";
query=util.format(queryString,ownername,ownermail,ownernumber,owneradd,user[0].uid);

result= yield databaseUtils.executeQuery(query);




this.redirect('/app/resort/'+rid);
},

	addNotification: function* (next) {
        var name=this.request.body.uname;
        var mail=this.request.body.email;
        var mobile=this.request.body.mobile;
        var rname=this.request.body.rname;
        var desc=this.request.body.description.replace(/'/g,"^");
        var query,queryString;
        this.body="name is:"+name+mail+mobile+rname+desc;

        queryString="insert into notification(name,email,mobile,resort_name,description) values('%s','%s','%s','%s','%s')";
        query=util.format(queryString,name,mail,mobile,rname,desc);
        yield databaseUtils.executeQuery(query);
        var redirectUrl='/app/home';
        this.redirect(redirectUrl);

},

showNotification: function*(next){
	var queryString="Select * from  notification";
		var results=yield databaseUtils.executeQuery(queryString);
		yield this.render('notification',{
			notification:results
		});
		},
updateUser: function*(next){
       var id=this.request.body.uid;
        var rol=this.request.body.role;
         queryString="update userrole set roleid='%s' where uid='%s'";

        query=util.format(queryString,rol,id);
        yield databaseUtils.executeQuery(query);
        var redirectUrl='/app/admin/listuser';
        this.redirect(redirectUrl);
    },

    deleteUser: function*(next){
       var id=this.request.body.uid;
        queryString="update user set remove=1 where uid='%s'";
        query=util.format(queryString,id);
        yield databaseUtils.executeQuery(query);

        var redirectUrl='/app/admin/listuser';
        this.redirect(redirectUrl);
    },

}
