import Toybox.Lang;
import Toybox.Timer;
import Toybox.System;
import Toybox.WatchUi;


class Solver {

    var app;
    var input;
    var timer;
    var part;
    var cent;
    var percent;

    function initialize(app, input) {
        me.app = app;
        me.input = input;
        me.timer = new Timer.Timer();
    }

    function reportProgress() {
        me.app.onProgress(me.percent.format("%.2f"));
    }
}