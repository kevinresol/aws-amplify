package aws.amplify;

import js.Promise;

#if amplify_global
@:native('window["aws-amplify"].Hub')
#else
@:jsRequire('aws-amplify', 'Hub')
#end
extern class Hub {
	static function listen(name:String, o:{onHubCapsule:Capsule->Void}):Void;
}

typedef Capsule = {
	payload:{
		event:String,
	}
}