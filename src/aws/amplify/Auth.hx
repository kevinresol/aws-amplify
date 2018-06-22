package aws.amplify;

import haxe.DynamicAccess;
import js.Promise;

#if amplify_global
@:native('window["aws-amplify"].Auth')
#else
@:jsRequire('aws-amplify', 'Auth')
#end
extern class Auth {
	static function signIn(username:String, password:String):Promise<Any>;
	static function signOut():Promise<Any>;
	
	static function signUp(info:SignUpInfo):Promise<Any>;
	static function confirmSignUp(username:String, code:String):Promise<Any>;
	static function resendSignUp(username:String):Promise<Any>;
	
	static function completeNewPassword(user:CognitoUser, password:String):Promise<Any>;
	static function changePassword(user:CognitoUser, oldPassword:String, newPassword:String):Promise<Any>;
	static function forgotPassword(username:String):Promise<Any>;
	static function forgotPasswordSubmit(username:String, code:String, password:String):Promise<Any>;
	
	static function currentAuthenticatedUser():Promise<CognitoUser>;
	static function currentSession():Promise<Session>;
	static function currentUserInfo():Promise<UserInfo>;
	static function currentUserPoolUser():Promise<CognitoUser>;
}

extern class CognitoUser {}

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