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
        } else if (item == :day_3) {
            System.println("Day 3");
            me.app.day = 3;
        } else if (item == :day_4) {
            System.println("day 4");
            me.app.day = 4;
        } else if (item == :day_5) {
            System.println("day 5");
            me.app.day = 5;
        }
        WatchUi.pushView(new Rez.Menus.PartMenu(), new MonkeyAOCPartMenuDelegate(me.app, dayMenu), WatchUi.SLIDE_LEFT);
    }

}