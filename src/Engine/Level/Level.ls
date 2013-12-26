package
{
	import loom.gameframework.LoomComponent;
	import loom2d.events.Event;
	import loom2d.tmx.TMXTileMap;
	import loom2d.textures.Texture;
	import loom2d.display.Stage;
	import loom2d.display.DisplayObjectContainer;
	import system.Vector;


	class Level extends DisplayObjectContainer
	{
		protected var tileMap:TMXTileMap;
		protected var bodies:Vector.<Body>;

		private var focusX:int;
		private var focuxY:int;

		function Level()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, function(event:Event)
			{
				this.doScale();
			});
		}

		protected function loadTileMap(path:String):void
		{
			if (tileMap != null) {
				this.removeChild(tileMap);
			}

			tileMap = new TMXTileMap();
			tileMap.load(path);

			for (var i:int = 0; i < tileMap.layers().length; i++) 
			{
				tileMap.addChild(tileMap.layers()[i].getHolder());
				trace(tileMap.layers()[i]);
				trace(tileMap.layers()[i].getFullTypeName());
			}

			this.addChild(tileMap);
		}

		protected function focus(x:int, y:int, scale:Number=null)
		{
			focusX = x;
			focuxY = y;
			if (scale != null) {
				this.scale = scale;
			}

			doScale();
		}

		private function doScale()
		{
			// @TODO bound the view

			if (stage != null) {
				// @TODO get parent containers bounding box, instead of stage
				//       look into DisplayObject.view
				var containerWidth:int = stage.width;
				var containerHeight:int = stage.height;

				this.y = -1 * scale * ((containerHeight / 2) - y);
				this.x = -1 * scale * ((containerWidth / 2) - x);

				this.scale = scale;
			}
		}
	}
}