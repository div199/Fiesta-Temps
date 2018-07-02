var databaseUtils = require('./services/databaseUtils');
var redisUtils = require('./services/redisUtils');
var logger = require('./logger');
var Constants = require('./constants');
var fs = require('fs');

// function storeTrendingListInRedis() {
//     var query = "select * from (select distinct r.*,m.* from (resort r join hall h on r.rid=h.rid) left join media m on m.hallid=h.hallid where r.remove=0 order by field(m.type,'other','video','image') desc) as medresorts group by medresorts.rid order by medresorts.rating desc";
//     databaseUtils.executePlainQuery(query, function(err, response) {
//         if(err) {
//             logger.logError(err);
//         } else {
//             redisUtils.setItem(Constants.redisDataKeys.TRENDING_LIST, JSON.stringify(response));
//         }
//     })
// }

// function storeGalleryListOnHomePageInRedis() {
//     var query = "select mid,url,min(m.hallid) as hallid,h.*,r.* from media m join hall h join resort r on m.hallid=h.hallid and h.rid=r.rid where type='image' and r.remove=0 group by m.hallid";
//     databaseUtils.executePlainQuery(query, function(err, response) {
//         if(err) {
//             logger.logError(err);
//         } else {
//             redisUtils.setItem(Constants.redisDataKeys.HOME_GALLERY_LIST, JSON.stringify(response));
//         }
//     })
// }

// function storeGalleryListInRedis() {
//     var query = "select mid,url,min(m.hallid) as hallid,h.*,r.* from media m join hall h join resort r on m.hallid=h.hallid and h.rid=r.rid where r.remove=0 and type='image' group by m.hallid";
//     databaseUtils.executePlainQuery(query, function(err, response) {
//         if(err) {
//             logger.logError(err);
//         } else {
//             redisUtils.setItem(Constants.redisDataKeys.GALLERY_LIST, JSON.stringify(response));
//         }
//     })
// }
// function storeGalleryListInRedis() {
//     var query = "select mid,url,min(m.hallid) as hallid,h.*,r.* from media m join hall h join resort r on m.hallid=h.hallid and h.rid=r.rid where r.remove=0 and type='image' group by m.hallid";
//     databaseUtils.executePlainQuery(query, function(err, response) {
//         if(err) {
//             logger.logError(err);
//         } else {
//             redisUtils.setItem(Constants.redisDataKeys.GALLERY_LIST, JSON.stringify(response));
//         }
//     })
// }
// storeTrendingListInRedis();
// storeGalleryListOnHomePageInRedis();
// storeGalleryListInRedis();