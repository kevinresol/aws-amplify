package aws.amplify;

import haxe.DynamicAccess;
import #if haxe4 js.lib.Promise #else js.Promise #end;

#if amplify_global
@:native('window.aws_amplify.Auth')
#else
@:jsRequire('@aws-amplify/auth', 'default')
#end
extern class Auth {
	static function signIn(username:String, password:String):Promise<CognitoUser>;
	static function signOut():Promise<Any>;
	
	static function federatedSignIn(provider:String, response:FederatedResponse, user:FederatedUser):Promise<Credentials>;
	
	static function signUp(info:SignUpInfo):Promise<Any>;
	static function confirmSignUp(username:String, code:String):Promise<Any>;
	static function resendSignUp(username:String):Promise<Any>;
	
	static function completeNewPassword(user:CognitoUser, password:String):Promise<CognitoUser>;
	static function changePassword(user:CognitoUser, oldPassword:String, newPassword:String):Promise<String>;
	static function forgotPassword(username:String):Promise<Any>;
	static function forgotPasswordSubmit(username:String, code:String, password:String):Promise<Any>;
	
	static function userAttributes(user:CognitoUser):Promise<Array<CognitoUserAttribute>>;
	static function userSession(user:CognitoUser):Promise<CognitoUserSession>;
	
	static function currentAuthenticatedUser():Promise<CognitoUser>; // or Any (for federated signin)
	static function currentSession():Promise<CognitoUserSession>;
	static function currentUserInfo():Promise<UserInfo>;
	static function currentUserPoolUser():Promise<CognitoUser>;
}

extern class CognitoUser {
	var username:String;
	var pool:CognitoUserPool;
	var Session:String;
	var client:Client;
	var signInUserSession:Dynamic;
	var authenticationFlowType:String;
	var challengeName:String;
	var challengeParam:{
		userAttributes:DynamicAccess<String>, 
		requiredAttributes:Array<Dynamic>,
	};
	
	function updateAttributes(attrs:Array<CognitoUserAttribute>):Promise<String>;
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

typedef CognitoUserSession = {
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

typedef FederatedResponse = {
	token:String,
	?identity_id:String,
	expires_at:Float,
}
typedef FederatedUser = {
	?email:String,
	name:String,
}
typedef Credentials = {
	accessKeyId:String,
	authenticated:Bool,
	identityId:String,
	secretAccessKey:String,
	sessionToken:String,

}

typedef CognitoUserAttribute = {
	Value:String,
	Name:String,
}