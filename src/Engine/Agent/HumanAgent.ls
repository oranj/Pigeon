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

			body.velocityX = 0;
			body.velocityY = 0;

			if (body == null) { 
				return;
			}
		}
		public function onKeyDown(key:LoomKey)
		{
			if (body == null) { 
				return;
			}

			body.velocityX = 0;
			body.velocityY = 0;

			switch (key) 
			{
				case LoomKey.UP_ARROW:
					body.velocityY = -32;
					break;
				case LoomKey.DOWN_ARROW:
					body.velocityY = 32;
					break;
				case LoomKey.LEFT_ARROW:
					body.velocityX = -32;
					break;
				case LoomKey.RIGHT_ARROW:
					body.velocityX = 32;
					break;
			}
		}
	}
}