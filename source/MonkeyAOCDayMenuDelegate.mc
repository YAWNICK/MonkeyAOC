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
            System.println("Day 1");
            me.app.day = 1;
        } else if (item == :day_2) {
            System.println("Day 2");
            me.app.day = 2;
        }
        WatchUi.pushView(new Rez.Menus.PartMenu(), new MonkeyAOCPartMenuDelegate(me.app, dayMenu), WatchUi.SLIDE_LEFT);
    }

}