package
{
	import loom2d.display.DisplayObject;
	import loom2d.events.Event;
	import loom2d.textures.Texture;
	import loom2d.display.Image;

	class Body extends Image
	{
		public static const MOVED:String="MOVED";

		function Body(texture:Texture) {
			this.texture = texture;
		}

		public function move(x:int, y:int):void {
			this.x = x;
			this.y = y;

			var event = new Event(Body.MOVED);

			dispatchEvent(event);
		}
	}
}