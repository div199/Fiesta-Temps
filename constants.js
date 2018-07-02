module.exports={
	ErrorMessage: {
		INVALID_USER_CREDENTIALS:"Invalid username or password credentials. Please try again!!",
		ALREADY_USER:"You are already a User. Try Log In.",
		BOOKING_NOT_FOUND:" The booking you requested was not found. Please try again !",
		INVALID_USER:"Sorry !!You are not authorised for this operation.",
		USER_NOT_FOUND:"The user you requested is not found. Please check the details and try again !!"
	},
	UserConstants:{
		OWNER_ROLEID:2,
		OWNER_ROLENAME:"resort",
		USER_ROLEID:1,
		USER_ROLENAME:"user",
		ADMIN_ROLEID:3,
		ADMIN_ROLENAME:"admin"
	},

    redisDataKeys: {
        PREVIOUS_URL:"previousUrl",
        CURRENT_URL:"currentUrl"
    },
    productStatus: {
        INACTIVE: 1,
        ACTIVE: 2,
        SOLD: 3
    }
};
