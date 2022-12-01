import Toybox.Lang;
import Toybox.WatchUi;

class MonkeyAOCDelegate extends WatchUi.BehaviorDelegate {

    var app;

    function initialize(app) {
        BehaviorDelegate.initialize();
        me.app = app;
    }

    function onSelect() {
        self.app.next();
    }

    function onMenu() as Boolean {
        var dayMenu = new Rez.Menus.DayMenu();
        WatchUi.pushView(dayMenu, new MonkeyAOCDayMenuDelegate(me.app, dayMenu), WatchUi.SLIDE_LEFT);
        return true;
    }

}