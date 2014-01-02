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
		public var isGrounded:Boolean = false;

		function Body(texture:Texture) {
			Image(texture);
		}

		public function onElapsed(seconds:Number) 
		{
			dispatchEvent(new Event(Body.MOVED));
		}

		public function getBoundary():BoxBoundary
		{
			return new BoxBoundary(x, y, x + width, y + height);
		}

		public function move(x:int, y:int):void {
			this.x = x;
			this.y = y;

			dispatchEvent(new Event(Body.MOVED));
		}
	}
}