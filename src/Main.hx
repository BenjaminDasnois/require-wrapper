class Main
{
	static function main()
	{
		if(Sys.args().length < 2)
		{
			Sys.println("Usage : require-wrapper file-to-wrap.js destination.js");
			Sys.exit(1);
		}
		
		var content = sys.io.File.getContent(Sys.args()[0]);
		content = StringTools.replace(content, 
							"})(typeof window != \"undefined\" ? window : exports);", 
							"return $hx_exports;\r\n})(exports);\r\ndefine(initTheCode);\r\n})()"
						   );
		content = "(function () {\r\nvar exports = {};\r\nvar initTheCode = " + content;
	
		sys.io.File.saveContent(Sys.args()[1], content);
		Sys.exit(0);
	}
}