package aws.amplify;

import haxe.DynamicAccess;
import js.Promise;

#if amplify_global
@:native('window["aws-amplify"].Auth')
#else
@:jsRequire('aws-amplify', 'Auth')
#end
extern class Auth {
	static function signIn(username:String, password:String):Promise<CognitoUser>;
	static function signOut():Promise<Any>;
	
	static function signUp(info:SignUpInfo):Promise<Any>;
	static function confirmSignUp(username:String, code:String):Promise<Any>;
	static function resendSignUp(username:String):Promise<Any>;
	
	static function completeNewPassword(user:CognitoUser, password:String):Promise<CognitoUser>;
	static function changePassword(user:CognitoUser, oldPassword:String, newPassword:String):Promise<String>;
	static function forgotPassword(username:String):Promise<Any>;
	static function forgotPasswordSubmit(username:String, code:String, password:String):Promise<Any>;
	
	static function currentAuthenticatedUser():Promise<CognitoUser>;
	static function currentSession():Promise<Session>;
	static function currentUserInfo():Promise<UserInfo>;
	static function currentUserPoolUser():Promise<CognitoUser>;
}

typedef CognitoUser = {
	username:String,
	pool:CognitoUserPool, 
	Session:String,
	client:Client, 
	signInUserSession:Dynamic, 
	authenticationFlowType:String,
	challengeName:String,
	challengeParam:{
		userAttributes:DynamicAccess<String>, 
		requiredAttributes:Array<Dynamic>,
	}
}

typedef Client = {
	endpoint:String,
	userAgent:String,
}

typedef CognitoUserPool = {
	userPoolId:String,
	clientId:String,
	client:Client, 
	advancedSecurityDataCollectionFlag:Bool,
}

typedef Session = {
	idToken:{
		jwtToken:String,
	},
}

typedef SignUpInfo = {
	username:String,
	password:String,
	?attributes:DynamicAccess<String>,
}

typedef UserInfo = {
	id:String,
	username:String,
	attributes:DynamicAccess<String>,
}