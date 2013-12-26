package
{
	import loom2d.display.DisplayObject;
	import loom2d.textures.Texture;

	class Body extends DisplayObject 
	{
		protected var texture:Texture;
		function Body(texture:Texture) {
			this.texture = texture;
		}
	}
}