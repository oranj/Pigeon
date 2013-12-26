package
{
    import loom.Application;
    import loom2d.display.StageScaleMode;
    import loom2d.display.Image;
    import loom2d.events.Event;
    import loom2d.textures.Texture;
    import loom2d.ui.SimpleLabel;

    public class Pigeon extends Application
    {
        override public function run():void
        {
            // Comment out this line to turn off automatic scaling.
            stage.scaleMode = StageScaleMode.LETTERBOX;
            var level = new LevelOne();
            var agent = new Agent();


            stage.addChild(level);

            //this.addEventListener(Event.
        }


    }
}