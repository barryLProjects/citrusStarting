package
{
	
	import citrus.core.starling.StarlingCitrusEngine;
	import flash.events.Event;
	
	[SWF(frameRate="60",width="1024",height="768",backgroundColor="")]

	public class Main extends StarlingCitrusEngine
	{
		public function Main()
		{
			
		}
		override protected function handleAddedToStage(e:Event):void {
			super.handleAddedToStage(e);
			setUpStarling(true);
		}
		override public function handleStarlingReady():void {
			state = new GameState2();
		}
	}
}