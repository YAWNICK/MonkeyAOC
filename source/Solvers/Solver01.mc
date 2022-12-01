import Toybox.Lang;
import Toybox.Timer;
import Toybox.System;
import Toybox.WatchUi;


class Solver01 {

    var app;
    var input;
    var timer;
    var part;
    var cent;
    var percent;

    var m1;
    var m2;
    var m3;

    function initialize(app, input) {
        me.app = app;
        me.input = input;
        me.timer = new Timer.Timer();
    }

    function solve(part) {
        me.m1 = 0;
        me.m2 = 0;
        me.m3 = 0;
        me.part = part;
        me.cent = me.input.length();
        me.app.onProgress("0.00");
        me.iterate();
    }

    function continueSolving() {
        iterate();
    }

    function reportProgress() {
        me.app.onProgress(me.percent.format("%.2f"));
    }

    function iterate() {
        var ns = me.input;
        var l = ns.length();
        System.println(l);
        var iSpace;
        var iSpaceSpace;
        var curr = 0;
        var n;
        var finished = false;
        var wdcnt = 0;
        while (wdcnt < 300) {
            iSpace = ns.find("\n");
            if (iSpace == null) {
                finished = true;
                break;
            }
            if (iSpace == 0) {
                insertMax(curr);
                curr = 0;
                ns = ns.substring(iSpace + 1, l);
                wdcnt += 1;
                continue;
            }
            n = ns.substring(0, iSpace).toNumber();
            curr += n;
            ns = ns.substring(iSpace + 1, l);
            wdcnt += 1;
        }
        if (finished) {
            if (me.part == 1) {
                app.result = me.m1;
            } else {
                app.result = me.m1 + me.m2 + me.m3;
            }
            app.onResult();
            return;
        }
        me.input = ns;
        me.percent = (1.0 - (l.toFloat() / me.cent)) * 100;
        me.timer.start(method(:reportProgress), 50, false);

    }

    function insertMax(n) {
        var h;
        if (n > me.m3) {
            me.m3 = n;
        }
        if (me.m3 > me.m2) {
            h = me.m3;
            me.m3 = me.m2;
            me.m2 = h;
        }
        if (me.m2 > me.m1) {
            h = me.m2;
            me.m2 = me.m1;
            me.m1 = h;
        }
    }
}