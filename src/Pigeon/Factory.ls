package {
	import loom2d.textures.Texture;
	import loom2d.math.Rectangle;

	public class Factory 
	{
		public static function MakeHumanAgent():HumanAgent
		{
			var textureLucas = Texture.fromAsset("assets/LucasXP.png");
			
			var texture = Texture.fromTexture(textureLucas, null, new Rectangle(0, -100, 30, 50));

			var body = new Body(texture);
			var agent = new HumanAgent(body);

			return agent;
		}
	}
}