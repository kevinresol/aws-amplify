package aws.amplify;

#if amplify_global
@:native('window["aws-amplify"].default')
#else
@:jsRequire('aws-amplify', 'default')
#end
extern class Amplify {
	static function configure(data:Dynamic):Void;
}