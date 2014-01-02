package
{
	import loom.gameframework.LoomComponent;
	import loom2d.events.Event;
	import loom2d.tmx.TMXTileMap;
	import loom2d.textures.Texture;
	import loom2d.display.Stage;
	import loom2d.display.Sprite;
	import loom2d.display.DisplayObjectContainer;
	import system.Vector;
	import loom2d.tmx.TMXLayer;

	class Level extends DisplayObjectContainer
	{
		protected var tileMap:TMXTileMap;
		protected var spriteLayer:Sprite;
		protected var physics:Physics;
		protected var trackedBody:Body;
		private var focusX:int;
		private var focusY:int;

		function Level()
		{
			spriteLayer = new Sprite();
			physics = new Physics();
			//physics.gravity = 10;

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

			if (tileMap.numLayers() != 7) {
				trace("Error, dog");
			}

			var layers = tileMap.layers();
			this.addChild(layers[0].getHolder());
			this.addChild(layers[1].getHolder());
			this.addChild(layers[2].getHolder());

			this.addChild(spriteLayer);

			this.addChild(layers[3].getHolder());
			this.addChild(layers[4].getHolder());
			this.addChild(layers[5].getHolder());

			var collisionLayer = layers[6];
			var collisions:Vector.<Number> = collisionLayer.getData();

			var layerWidth = tileMap.mapWidth();
			var layerHeight = collisions.length / layerWidth;
			var tileWidth = tileMap.tileWidth();
			var tileHeight = tileMap.tileHeight();


			var k:Number = 0;

			for (var y = 0; y < layerHeight; y ++) 
			{
				for (var x = 0; x < layerWidth; x++) 
				{
					if (collisions[k] == 1) // square boundary
					{
						physics.addBoundary(new BoxBoundary(
							x * tileWidth,
							y * tileHeight, 
							(x + 1) * tileWidth,
							(y + 1) * tileHeight
						));

						trace("Adding tile at " + x + ', ' + y);
					}
					else if (collisions[k] == 2) // top boundary only
					{

					}
					k++;
				}
			}


			//this.addChild(tileMap); 
		}

		public function addBody(body:Body):void
		{
			physics.addBody(body);
			spriteLayer.addChild(body);
		}

		public function trackBody(body:Body):void
		{
			if (trackedBody != null) {
				trackedBody.removeEventListeners(Body.MOVED);
			}

			trackedBody = body;
			if (trackedBody != null) {
				
				trackedBody.addEventListener(Body.MOVED, 
					function(event:Event) {
						focus(trackedBody.x, - trackedBody.y);
					}
				);
			}
		}

		protected function focus(x:int, y:int, scale:Number=null)
		{
			focusX = x;
			focusY = y;
			if (scale != null) {
				this.scale = scale;
			}

			doScale();
		}

		public function onElapsed(seconds:Number) 
		{
			physics.onElapsed(seconds);
		}

		private function doScale()
		{
			// @TODO bound the view

			if (stage != null) {
				// @TODO get parent containers bounding box, instead of stage
				//       look into DisplayObject.view
				var containerWidth = stage.nativeStageWidth;
				var containerHeight = stage.nativeStageHeight;
				var levelWidth = this.width;
				var levelHeight = this.height;

				// perhaps cast to int? doesn't necessarily make any sense though.

				this.y = scale * ((containerHeight / 2) + this.focusY);
				this.x = scale * ((containerWidth / 2) - this.focusX);

				this.scale = scale;
			}
		}
	}
}