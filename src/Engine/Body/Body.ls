package
{
	import loom.gameframework.LoomComponent;
	import loom2d.textures.Texture;

	class Body extends LoomComponent 
	{
		protected var texture:Texture;
		function Body(texture:Texture) {
			this.texture = texture;
		}
	}
}