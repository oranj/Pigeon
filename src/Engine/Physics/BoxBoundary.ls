package
{
	import loom2d.math.Rectangle;

	class BoxBoundary
	{
		public var top:Number;
		public var right:Number;
		public var bottom:Number;
		public var left:Number;

		public static const COLLIDE_NONE:Number   = 0;
		public static const COLLIDE_LEFT:Number   = 1;
		public static const COLLIDE_TOP:Number    = 2;
		public static const COLLIDE_RIGHT:Number  = 3;
		public static const COLLIDE_BOTTOM:Number = 4;


		function BoxBoundary(left:Number, top:Number, right:Number, bottom:Number) 
		{
			this.top = top;
			this.right = right;
			this.bottom = bottom;
			this.left = left;
		}

		public function toString():String
		{
			var str:String = "<" + this.left + ", " + this.top + ", " + this.right + ", " + this.bottom +">";
			return str;
		}

		public function intersects(body:BoxBoundary):Number
		{
			if (body.bottom >= top && body.bottom < bottom) 
			{
				if ((body.right > left && body.right <= right) || (body.left <= right && body.left > left)) 
				{ 
					return COLLIDE_TOP;
				}
			} 
			else if (body.top < bottom && body.top >= top)
			{
				if ((body.right > left && body.right <= right) || (body.left <= right && body.left > left)) 
				{ 
					return COLLIDE_BOTTOM;
				}
			}
			else if (body.left <= right && body.left > left)
			{
				if ((body.bottom > top && body.bottom <= bottom) || (body.top > top && body.top <= bottom)) 
				{ 
					return COLLIDE_RIGHT;
				}
			}
			else if (body.right > left && body.right <= right)
			{
				if ((body.bottom > top && body.bottom <= bottom) || (body.top > top && body.top <= bottom))
				{
					return COLLIDE_LEFT;
				}
			}
			return COLLIDE_NONE;
		}
	}
}