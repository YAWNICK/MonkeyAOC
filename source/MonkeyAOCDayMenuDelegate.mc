import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class MonkeyAOCDayMenuDelegate extends WatchUi.MenuInputDelegate {

    var app;
    var dayMenu;

    function initialize(app, dayMenu) {
        MenuInputDelegate.initialize();
        me.app = app;
        me.dayMenu = dayMenu;
    }

    function onMenuItem(item as Symbol) as Void {
        if (item == :day_1) {
            me.app.day = 1;
        } else if (item == :day_2) {
            me.app.day = 2;
        } else if (item == :day_3) {
            me.app.day = 3;
        } else if (item == :day_4) {
            me.app.day = 4;
        } else if (item == :day_5) {
            me.app.day = 5;
        } else if (item == :day_6) {
            me.app.day = 6;
        } else if (item == :day_7) {
            me.app.day = 7;
        }
        WatchUi.pushView(new Rez.Menus.PartMenu(), new MonkeyAOCPartMenuDelegate(me.app, dayMenu), WatchUi.SLIDE_LEFT);
    }

}