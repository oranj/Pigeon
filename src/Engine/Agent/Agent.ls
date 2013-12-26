package
{
	import loom2d.display.DisplayObject;
	import loom2d.textures.Texture;
	
	public class Agent extends DisplayObject
	{
		protected var body:Body;
		public function getBody():Body
		{
			return this.body;
		}
	}
}