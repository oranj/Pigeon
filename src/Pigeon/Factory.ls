package {
	import loom2d.textures.Texture;

	public class Factory 
	{
		public static function MakeHumanAgent():HumanAgent
		{
			var texture = Texture.fromAsset("assets/LucasXP.png");
			var body = new Body(texture);
			var agent = new HumanAgent(body);

			return agent;
		}
	}
}