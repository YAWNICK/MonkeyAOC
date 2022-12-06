import Toybox.Lang;
import Toybox.Timer;
import Toybox.System;
import Toybox.WatchUi;


class Solver04 extends Solver {

    var DashIndex = { 3 => 1, 4 => 1, 5 => 2 };

    var res;
    var i;

    function initialize(app, input) {
        Solver.initialize(app, input);
    }

    function solve(part) {
        me.res = 0;
        me.i = 0;
        me.part = part;
        me.cent = me.input.length();
        me.app.initiateProgress();
        me.iterate();
    }

    function continueSolving() {
        iterate();
    }

    function iterate() {
        var ns = me.input;
        var searchstr;
        var iSpace;
        var line;
        var iComma;
        var ildash;
        var irdash;
        var x1;
        var x2;
        var y1;
        var y2;
        var finished = false;
        var wdcnt = 0;
        while (wdcnt < 100) {
            searchstr = ns.substring(me.i, me.i+15);
            iSpace = searchstr.find("\n");
            if (iSpace == null) {
                finished = true;
                break;
            }
            
            line = searchstr.substring(0, iSpace);
            iComma = line.find(",");
            
            ildash = me.DashIndex[iComma];
            irdash = me.DashIndex[iSpace - (iComma + 1)] + iComma + 1;
            x1 = line.substring(0, ildash).toNumber();
            x2 = line.substring(ildash+1, iComma).toNumber();
            y1 = line.substring(iComma+1, irdash).toNumber();
            y2 = line.substring(irdash+1, iSpace).toNumber();
            if (me.part == 1) {
                if (x1 >= y1 && x2 <= y2 || y1 >= x1 && y2 <= x2) {
                    me.res += 1;
                }
            } else {
                if (x1>=y1 && x1<=y2 || x2>=y1 && x2<=y2 || y1>=x1 && y1<=x2 || y2>=x1 && y2<=x2) {
                    me.res += 1;
                }
            }
            me.i += iSpace + 1;
            wdcnt += 1;
        }
        if (finished) {
            app.result = me.res;
            app.onResult();
            return;
        }
        me.percent = me.i.toFloat() / me.cent * 100;
        me.timer.start(method(:reportProgress), 50, false);
    }
}