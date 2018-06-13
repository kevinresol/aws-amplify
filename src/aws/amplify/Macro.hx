package aws.amplify;

import haxe.macro.Context;

class Macro {
	public static macro function parseConfig(path:String) {
		var pos =  Context.currentPos();
		var path = Context.resolvePath(path);
		var content = sys.io.File.getContent(path);
		var start = content.indexOf('{');
		var end = content.indexOf('}');
		var sub = content.substring(start, end + 1);
		return Context.parseInlineString(sub, pos);
	}
}