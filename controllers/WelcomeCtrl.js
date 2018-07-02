var sessionUtils = require('./../services/sessionUtils');
var Constants = require('./../constants');
var config = require('./../config');
var databaseUtils = require('./../services/databaseUtils');
var redisUtils = require('./../services/redisUtils');
var util = require('util');

module.exports = {
   

    showGalleryPage: function* (next) {
        var queryString="select mid,url,min(m.hallid) as hallid,h.*,r.* from media m join hall h join resort r on m.hallid=h.hallid and h.rid=r.rid where r.remove=0 and type='image' group by r.rid";
    var med=yield databaseUtils.executeQuery(queryString);
     yield this.render('gallery',{
            booking : med
        });
    },
    showResortGalleryPage: function*(next){
        var rid=this.params.rid;
        var queryString=" select m.*,h.*,r.* from media m join hall h join resort r on m.hallid=h.hallid and h.rid=r.rid where r.rid='%s' and m.type='image'";
        var query=util.format(queryString,rid);
        var images=yield databaseUtils.executeQuery(query);
        // queryString=" select m.*,h.*,r.* from media m join hall h join resort r on m.hallid=h.hallid and h.rid=r.rid where r.rid='%s' and m.type='video'";
        // query=util.format(queryString,rid);
        // var video=yield databaseUtils.executeQuery(query);
        // queryString=" select m.*,h.*,r.* from media m join hall h join resort r on m.hallid=h.hallid and h.rid=r.rid where r.rid='%s' and m.type='other'";
        // query=util.format(queryString,rid);
        // var other=yield databaseUtils.executeQuery(query);

        yield this.render('gallery2',{
            images:images
            // video:video,
            // other:other
        });

    },
    showAboutUs: function* (next) {
        var errorMessage;
        yield this.render('aboutUs', {
            errorMessage: errorMessage
        });
    },
    
   
    faq: function* (next) {
        
        yield this.render('faq');
    },
   

     showHomePage: function* (next){
        
        var queryString="select * from (select distinct r.*,m.* from (resort r join hall h on r.rid=h.rid) left join media m on m.hallid=h.hallid where r.remove=0 order by field(m.type,'other','video','image') desc) as medresorts group by medresorts.rid order by medresorts.rating desc";
       var result=yield databaseUtils.executeQuery(queryString);
       queryString="select mid,url,min(m.hallid) as hallid,h.*,r.* from media m join hall h join resort r on m.hallid=h.hallid and h.rid=r.rid where type='image' and r.remove=0 group by m.hallid";
       var gallery=yield databaseUtils.executeQuery(queryString);
       
        yield this.render('home', {
            trending: result,
            gallery:gallery,
            errorMessage:null
        });
    },

    
     showOurTeam: function*(next){
        yield this.render('ourteam');
     }

}
