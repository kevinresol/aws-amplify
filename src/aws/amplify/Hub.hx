package aws.amplify;

import js.Promise;

#if amplify_global
@:native('window["aws-amplify"].Hub')
#else
@:jsRequire('aws-amplify', 'Hub')
#end
extern class Hub {
	static function listen(name:String, f:Capsule->Void):Void;
}

typedef Capsule = {
	channel:String,
	source:String,
	payload:Payload,
}

typedef Payload = {
	event:String,
	?data:Any,
	?message:String,
}