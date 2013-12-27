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

			if (key == LoomKey.UP_ARROW || key == LoomKey.DOWN_ARROW) {
				trace("Stopping vertical");
				body.velocityY = 0;
			} 

			if (key == LoomKey.LEFT_ARROW || key == LoomKey.RIGHT_ARROW) {
				trace("Stopping horizontal");
				body.velocityX = 0;
			}
			

			if (body == null) { 
				return;
			}
		}
		public function onKeyDown(key:LoomKey)
		{
			if (body == null) { 
				return;
			}

			switch (key) 
			{
				case LoomKey.UP_ARROW:
					body.velocityY = -64;
					break;
				case LoomKey.DOWN_ARROW:
					body.velocityY = 64;
					break;
				case LoomKey.LEFT_ARROW:
					body.velocityX = -64;
					break;
				case LoomKey.RIGHT_ARROW:
					body.velocityX = 64;
					break;
			}
		}
	}
}