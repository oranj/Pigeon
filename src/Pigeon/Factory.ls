package {
	import loom2d.textures.Texture;
	import loom2d.math.Rectangle;
	import loom2d.textures.TextureAtlas;

	public class Factory 
	{
		public static function MakeHumanAgent():HumanAgent
		{
			var spriteTexture = Texture.fromAsset("assets/lucasxp.png");
			var atlas = new TextureAtlas(spriteTexture);

			atlas.addRegion("dn0", new Rectangle(00, 000, 30, 50));
			atlas.addRegion("dn1", new Rectangle(30, 000, 30, 50));
			atlas.addRegion("dn2", new Rectangle(60, 000, 30, 50));
			atlas.addRegion("dn3", new Rectangle(90, 000, 30, 50));

			atlas.addRegion("bk0", new Rectangle(00, 050, 30, 50));
			atlas.addRegion("bk1", new Rectangle(30, 050, 30, 50));
			atlas.addRegion("bk2", new Rectangle(60, 050, 30, 50));
			atlas.addRegion("bk3", new Rectangle(90, 050, 30, 50));

			atlas.addRegion("fw0", new Rectangle(00, 100, 30, 50));
			atlas.addRegion("fw1", new Rectangle(30, 100, 30, 50));
			atlas.addRegion("fw2", new Rectangle(60, 100, 30, 50));
			atlas.addRegion("fw3", new Rectangle(90, 100, 30, 50));

			atlas.addRegion("up0", new Rectangle(00, 150, 30, 50));
			atlas.addRegion("up1", new Rectangle(30, 150, 30, 50));
			atlas.addRegion("up2", new Rectangle(60, 150, 30, 50));
			atlas.addRegion("up3", new Rectangle(90, 150, 30, 50));

			var fwz = atlas.getTexture("dn0");

			trace(fwz);

			var body = new Body(atlas.getTexture("dn0"));
			var agent = new HumanAgent(body);

			return agent;
		}
	}
}