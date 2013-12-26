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
		protected var trackedBody:Body;
		protected var gravity:Number = -10;

		private var focusX:int;
		private var focusY:int;

		function Level()
		{
			bodies = new Vector.<Body>();
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
			}

			this.addChild(tileMap);
		}

		public function addBody(body:Body):void
		{
			bodies.push(body);
			addChild(body);
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
			trace(seconds);
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

			//	var levelOffsetX = (containerWidth / 2) - this.focusX;
			//	var levelOffsetY = (containerWidth / 2) - this.focusX;

				trace(containerWidth, containerHeight);

				// perhaps cast to int? doesn't necessarily make any sense though.
				
				this.y = -1 * scale * ((containerHeight / 2) - this.focusY);
				this.x = scale * ((containerWidth / 2) - this.focusX);

				trace(this.x, this.y, this.scale);

				this.scale = scale;
			}
		}
	}
}