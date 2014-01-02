package
{
	class Physics
	{
		protected var bodies:Vector.<Body>;
		protected var boundaries:Vector.<BoxBoundary>;
		
		public var gravity:Number = 0;

		function Physics()
		{
			bodies = new Vector.<Body>();
			boundaries = new Vector.<BoxBoundary>();
		}

		public function addBody(body:Body) 
		{
			bodies.push(body);
		}

		public function addBoundary(boundary:BoxBoundary)
		{
			boundaries.push(boundary);
		}

		public function onElapsed(seconds:Number) 
		{
			bodies.forEach(function(body:Body) 
			{

				body.velocityY += gravity * seconds;

				var x = body.x;
				var y = body.y;

				body.x += (body.velocityX * seconds);
				body.y += (body.velocityY * seconds);

				var boundary = body.getBoundary();
				body.isGrounded = false;
				for (var i = 0; i < boundaries.length; i++) 
				{
					var staticBoundary = boundaries[i];
					var intersection = staticBoundary.intersects(boundary);

					switch (intersection)
					{
						case BoxBoundary.COLLIDE_LEFT:
							body.x = (staticBoundary.left - body.width);
							body.velocityX = 0;
							break;
						case BoxBoundary.COLLIDE_TOP:
							body.isGrounded = true;
							body.y = (staticBoundary.top - body.height);
							body.velocityY = 0;
							break;
						case BoxBoundary.COLLIDE_RIGHT:
							body.x = staticBoundary.right;
							body.velocityX = 0;
							break;
						case BoxBoundary.COLLIDE_BOTTOM:
							body.y = staticBoundary.bottom;
							body.velocityY = 0;
							break;
					}
					if (intersection != 0) {
						break;
					}
				}

				body.onElapsed(seconds);
			});
		}
	}
}