import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class MonkeyAOCPartMenuDelegate extends WatchUi.MenuInputDelegate {

    var app;
    var dayMenu;

    function initialize(app, dayMenu) {
        MenuInputDelegate.initialize();
        me.app = app;
        me.dayMenu = dayMenu;
    }

    function onMenuItem(item as Symbol) as Void {
        if (item == :part_1) {
            System.println("Part 1");
            me.app.part = 1;
        } else if (item == :part_2) {
            System.println("Part 2");
            me.app.part = 2;
        }
        me.dayMenu.popView(WatchUi.SLIDE_LEFT);
    }

}