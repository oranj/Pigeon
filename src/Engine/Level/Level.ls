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
		protected var bodies:Vector.<Body>;
		protected var trackedBody:Body;
		protected var gravity:Number = -100;
		protected var spriteLayer:Sprite;

		private var focusX:int;
		private var focusY:int;

		function Level()
		{
			bodies = new Vector.<Body>();
			spriteLayer = new Sprite();

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

			var layers = tileMap.layers();

			if (layers.length != 7) {
				var iii = 1 / 0;
			}

			this.addChild(layers[0].getHolder());
			this.addChild(layers[1].getHolder());
			this.addChild(layers[2].getHolder());

			this.addChild(spriteLayer);

			this.addChild(layers[3].getHolder());
			this.addChild(layers[4].getHolder());
			this.addChild(layers[5].getHolder());

			var collisionLayer = layers[6];


			//this.addChild(tileMap); 
		}

		public function addBody(body:Body):void
		{
			bodies.push(body);
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
			bodies.forEach(function(body:Body) {
				body.velocityY -= gravity * seconds;
				body.onElapsed(seconds);
			});
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