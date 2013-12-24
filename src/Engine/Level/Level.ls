package
{
	import loom.gameframework.LoomComponent;
	import loom2d.tmx.TMXTileMap;
	import loom2d.textures.Texture;
	import system.Vector;

	class Level extends LoomComponent
	{
		private var tileMap:TMXTileMap;
		private var bodies:Vector.<Body>;

		function Level(tileMap:TMXTileMap, bodies:Vector.<Body>) 	
		{
			
		}
	}
}