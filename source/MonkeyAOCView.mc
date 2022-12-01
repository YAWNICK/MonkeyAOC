import Toybox.Graphics;
import Toybox.WatchUi;

class MonkeyAOCView extends WatchUi.View {

    var app;

    function initialize(app) {
        View.initialize();
        me.app = app;
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        //setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        //View.onUpdate(dc);
        dc.setColor(Graphics.COLOR_TRANSPARENT, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        if (me.app.state == 0) {
            dc.drawText(dc.getWidth() / 2, 50, Graphics.FONT_MEDIUM, "Select day & part in menu,\nthen press Enter to\nload input", Graphics.TEXT_JUSTIFY_CENTER);
        } else if (me.app.state == 1) {
            dc.drawText(dc.getWidth() / 2, 50, Graphics.FONT_LARGE, "Press Enter\nto solve", Graphics.TEXT_JUSTIFY_CENTER);
        } else if (me.app.state == 2) {
            dc.drawText(dc.getWidth() / 2, 50, Graphics.FONT_LARGE, "Calculating:\n"+me.app.msg, Graphics.TEXT_JUSTIFY_CENTER);
        } else {
            dc.drawText(dc.getWidth() / 2, 50, Graphics.FONT_LARGE, me.app.result, Graphics.TEXT_JUSTIFY_CENTER);
        }
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
