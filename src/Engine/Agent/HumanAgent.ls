package
{
    import loom.platform.LoomKey;
	public class HumanAgent extends Agent 
	{
		function HumanAgent(body:Body) 
		{
			this.body = body;
		}

		public function onKeyUp(key:LoomKey)
		{
			if (body == null) { 
				return;
			}
			trace("UP");
			trace(key);

		}
		public function onKeyDown(key:LoomKey)
		{
			if (body == null) { 
				return;
			}

			trace("DOWN");
			trace(key);

			switch (key) 
			{
				case LoomKey.UP_ARROW:
					body.move(this.body.x, this.body.y - 8);
					break;
				case LoomKey.DOWN_ARROW:
					body.move(this.body.x, this.body.y + 8);
					break;
				case LoomKey.LEFT_ARROW:
					body.move(this.body.x - 8, this.body.y);
					break;
				case LoomKey.RIGHT_ARROW:
					body.move(this.body.x + 8, this.body.y);
					break;
			}
		}
	}
}