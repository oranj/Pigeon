package
{
    import loom.Application;
    import loom2d.display.StageScaleMode;
    import loom2d.display.Image;
    import loom2d.events.Event;
    import loom2d.textures.Texture;
    import loom2d.ui.SimpleLabel;
    import loom2d.events.KeyboardEvent;
    import loom.gameframework.TimeManager;

    import system.xml.XMLDocument;
    import loom2d.textures.TextureAtlas;

    public class Pigeon extends Application
    {

        protected var agent:HumanAgent;
        protected var time:TimeManager;
        protected var lastTime:Number;
        protected var level:Level;

        override public function run():void
        {
            time = new TimeManager();
            time.start();
            lastTime = time.platformTime;

            // Comment out this line to turn off automatic scaling.
            stage.scaleMode = StageScaleMode.LETTERBOX;

            level = new LevelOne();
            
            agent = Factory.MakeHumanAgent();

            stage.addChild(level);

            level.trackBody(agent.getBody());
            level.addBody(agent.getBody());

            var ta_file = new XMLDocument();
            ta_file.loadFile("lucasxp_ta.xml");

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

        private function onTick():void
        {
            var elapsed = time.platformTime - lastTime;
            lastTime = time.platformTime;

            level.onElapsed(elapsed / 1000);
        }

    }
}