import Toybox.Lang;
import Toybox.Timer;
import Toybox.System;
import Toybox.WatchUi;


class Solver06 extends Solver {

    var i;
    var seqlen;

    function initialize(app, input) {
        Solver.initialize(app, input);
    }

    function solve(part) {
        me.i = 0;
        me.seqlen = (part == 1) ? 4 : 14;
        me.part = part;
        me.cent = me.input.length();
        me.app.initiateProgress();
        me.input = me.input.toCharArray();
        me.iterate();
    }

    function continueSolving() {
        iterate();
    }

    function iterate() {
        var c;
        var j;
        var set;
        var mask;
        var wdcnt = 0;
        while (wdcnt < 200) {
            set = 0;
            for (j = me.i; j < me.i + me.seqlen; j++) {
                c = me.input[j].toNumber() - 97;
                mask = (1 << c);
                if ((set & mask) != 0) {
                    break;
                }
                set |= mask;
            }
            if (j == me.i + me.seqlen) {
                app.result = me.i + me.seqlen;
                app.onResult();
                return;
            }
            me.i += 1;
            wdcnt += 1;
        }
        me.percent = me.i.toFloat() / me.cent * 100;
        me.timer.start(method(:reportProgress), 50, false);
    }
}