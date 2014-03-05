package
{
	import citrus.core.starling.StarlingState;
	
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.phys.Material;
	import nape.shape.Circle;
	import nape.shape.Polygon;
	import nape.space.Space;
	
	import starling.events.Event;
	
	public class GameState2 extends StarlingState
	{
		private var space:Space;
		
		public function GameState2()
		{
			super();
		}
		override public function initialize():void
		{
			super.initialize();
			var gravity:Vec2=new Vec2(0,600);
			space=new Space(gravity);
			
			var floorBody:Body=new Body(BodyType.STATIC);
			var floorShape:Polygon=new Polygon(Polygon.rect(0,stage.height,stage.width,4));
			floorBody.shapes.add(floorShape);
			space.bodies.add(floorBody);
			
			var circle:Circle=new Circle(10);
			var anotherCircle:Circle = new Circle(10,new Vec2(5,0));
			
			var circleBody:Body=new Body();
			circleBody.position.setxy(stage.width>>1,stage.height>>1);
			circleBody.velocity.setxy(0,1000);
			
			circleBody.shapes.add(circle);
			circleBody.shapes.add(anotherCircle);
			
			circle.material.elasticity=1;
			circle.material.density=4;
			circle.material = Material.rubber();
			
			space.bodies.add(circleBody);
			
			this.addEventListener(Event.ENTER_FRAME,onLoop);
			
			
		}
		private function onLoop(e:Event):void
		{
			space.step(1/60);
		}
	}
}