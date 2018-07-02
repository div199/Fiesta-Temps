module.exports={
	env: 'dev',
	applicationUrl: 'http://localhost:3000',
	port:{
	http: 3000,
	https: 443
	},
	loggingMode: 'error',
	redisConfig:{
	host: '127.0.0.1',
	port:6379
	},
	databaseConnection:{
	connectionLimit: 5,
	host : '127.0.0.1',
	user :'root',
	password : 'harshita',
	database : 'project'
	},
	enableGoogleAnalyticsTracking: false

	};
