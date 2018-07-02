var databaseUtils=require('./../services/databaseUtils');
var util=require('util');

module.exports={
	showAllUsers: function*(next){
		var queryString="Select * from user,role,userrole where user.uid=userrole.uid and role.roleid=userrole.roleid order by user.uid";
		var results=yield databaseUtils.executeQuery(queryString);
		yield this.render('allusers',{
			user:results
		});
		},
	showAllResorts: function*(next){
		var queryString="Select * from resort";
		var results=yield databaseUtils.executeQuery(queryString);
		yield this.render('allresorts',{
			resorts:results
		});
	},

		updateuser: function*(next){
			 var id=this.request.body.uid;
        var rol=this.request.body.role;
         queryString="update userrole set roleid='%s' where uid='%s'";
       
        query=util.format(queryString,rol,id);
        yield databaseUtils.executeQuery(query);
        var redirectUrl='/app/admin/listuser';
        this.redirect(redirectUrl);
		},

		deleteuser: function*(next){
			 var id=this.request.body.uid;
        queryString="delete from user where uid='%s'";
       query=util.format(queryString,id);
        yield databaseUtils.executeQuery(query);
        queryString="delete from userrole where uid='%s'";
       query=util.format(queryString,id);
        yield databaseUtils.executeQuery(query);
        var redirectUrl='/app/admin/listuser';
        this.redirect(redirectUrl);
		},

	showResort: function*(next){
		var rid=this.params.rid;
		var queryString="Select * from resort,hall where hall.rid=resort.rid and resort.rid=%s";
		var query=util.format(queryString,rid);
		var results=yield databaseUtils.executeQuery(query);
		yield this.render('resort',{
			resort:results
		});
	},
	addResortPage: function*(next){
		yield this.render('newResortForm');
	},
	addResort: function*(){
		
	}
}