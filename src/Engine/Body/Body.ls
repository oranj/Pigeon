package
{
	import loom2d.display.DisplayObject;
	import loom2d.events.Event;
	import loom2d.textures.Texture;
	import loom2d.display.Image;

	class Body extends Image
	{
		public static const MOVED:String="MOVED";

		public var velocityX:Number;
		public var velocityY:Number;

		function Body(texture:Texture) {
			Image(texture);
		}

		public function onElapsed(seconds:Number) 
		{
			this.x = (int)(this.x + (velocityX * seconds));
			this.y = (int)(this.y + (velocityY * seconds));

			if (y <= 0) {
				y = 0;
				velocityY = 0;
			}

			trace(x, y);

			dispatchEvent(new Event(Body.MOVED));
		}

		public function move(x:int, y:int):void {
			this.x = x;
			this.y = y;

			dispatchEvent(new Event(Body.MOVED));
		}
	}
}