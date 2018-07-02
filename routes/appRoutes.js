var Router= require('koa-router');
var bodyParser = require('koa-body')();

   
module.exports = function(app){
 var router = new Router();

    //Welcome Routes
var searchCtrl = require('./../controllers/SearchCtrl');
var userCtrl = require('./../controllers/UserCtrl');
   var bookingCtrl = require('./../controllers/ResortBookingCtrl');
   var welcomeCtrl = require('./../controllers/WelcomeCtrl');
   var adminCtrl=require('./../controllers/AdminCtrl');
  router.get('/home', welcomeCtrl.showHomePage);
  router.get('/gallery',welcomeCtrl.showGalleryPage);
  router.get('/gallery/:rid',welcomeCtrl.showResortGalleryPage);
  router.get('/faq',welcomeCtrl.faq);
  //router.post('/feedback',bodyparser,welcomeCtrl.feedbackpost);
  router.get('/aboutus',welcomeCtrl.showAboutUs);
  router.get('/ourteam',welcomeCtrl.showOurTeam);

  //user controller:
 
  router.post('/login',userCtrl.login);
  router.post('/signup', userCtrl.signup);
  router.get('/logout', userCtrl.logout);
   
  //Booking Controller:
  router.get('/:role/bookings',bookingCtrl.showMyBookings);
  router.get('/resort/:rid/bookingstatus',bookingCtrl.showMyResort);
  router.get('/resort/:rid',bookingCtrl.showResortByName);
  router.post('/confirmmybooking',bookingCtrl.showConfirmPage);
  router.post('/doBooking/book',bookingCtrl.bookNewBooking);
  router.get('/:role/bookings/:bookingid/cancel',bookingCtrl.cancelMyBooking);
  router.get('/:role/bookings/:bookingid/confirm',bookingCtrl.confirmMyBooking);
  

  //Search Controller:
  router.get('/searchbydate',searchCtrl.showSearchByDatePage);
  router.post('/searchbydate',searchCtrl.searchByDate);
  router.get('/searchbyvenue',searchCtrl.showSearchByVenuePage);
  router.post('/searchbyvenue',searchCtrl.searchByVenue);
 
  //router.get('/listresort',searchCtrl.listWithLocation);
   
//Admin controller :
    router.get('/admin/listuser',adminCtrl.showAllUsers);
    router.get('/admin/listresort',adminCtrl.showAllResorts);
    
    router.get('/admin/resort/addnew',adminCtrl.addResortPage);
    router.post('/admin/resort/addnew',adminCtrl.addResort);
    router.get('/admin/resort/:rid/remove',adminCtrl.removeResort);
    router.get('/admin/resort/:rid/update',adminCtrl.getUpdateForm);
    router.post('/admin/resort/:rid/update',adminCtrl.updateResort);
    router.post('/becomehost', adminCtrl.addNotification);
    router.get('/admin/showNotification',adminCtrl.showNotification);
    router.post('/admin/updateuser',adminCtrl.updateUser);
    router.post('/admin/deleteuser',adminCtrl.deleteUser);

     
    return router.middleware();
}
