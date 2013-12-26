package
{
    import loom.Application;
    import loom2d.display.StageScaleMode;
    import loom2d.display.Image;
    import loom2d.events.Event;
    import loom2d.textures.Texture;
    import loom2d.ui.SimpleLabel;
    import loom2d.events.KeyboardEvent;

    public class Pigeon extends Application
    {

        protected var agent:HumanAgent;

        override public function run():void
        {
            // Comment out this line to turn off automatic scaling.
            stage.scaleMode = StageScaleMode.LETTERBOX;

            var level = new LevelOne();
            
            agent = Factory.MakeHumanAgent();


            stage.addChild(level);
            stage.addChild(agent.getBody());
            
            level.trackBody(agent.getBody());



            stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
            stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
        }

        private function keyDownHandler(event:KeyboardEvent):void
        {
            this.agent.onKeyDown(event.keyCode);
        }

        private function keyUpHandler(event:KeyboardEvent):void
        {
            this.agent.onKeyUp(event.keyCode);
        }

    }
}