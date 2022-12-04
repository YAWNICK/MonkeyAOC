import Toybox.Lang;
import Toybox.Timer;
import Toybox.System;
import Toybox.WatchUi;


class Solver01 {

    var m1;
    var m2;
    var m3;
    var i;

    function initialize(app, input) {
        Solver.initialize(app, input);
    }

    function solve(part) {
        me.m1 = 0;
        me.m2 = 0;
        me.m3 = 0;
        me.i = 0;
        me.part = part;
        me.cent = me.input.length();
        me.app.onProgress("0.00");
        me.iterate();
    }

    function continueSolving() {
        iterate();
    }

    function iterate() {
        var ns = me.input;
        var iSpace;
        var searchstr;
        var nstr;
        var curr = 0;
        var n;
        var finished = false;
        var wdcnt = 0;
        while (wdcnt < 50) {
            searchstr = ns.substring(me.i, me.i+10);
            iSpace = searchstr.find("\n");
            if (iSpace == null) {
                finished = true;
                break;
            }
            if (iSpace == 0) {
                insertMax(curr);
                curr = 0;
                wdcnt += 1;
            } else {
                nstr = searchstr.substring(0, iSpace);
                n = nstr.toNumber();
                curr += n;
            }
            me.i = me.i + iSpace + 1;
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
        me.percent = me.i.toFloat() / me.cent * 100;
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