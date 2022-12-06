import Toybox.Lang;
import Toybox.Timer;
import Toybox.System;
import Toybox.WatchUi;


class Solver02 extends Solver {

    var Score = { "AX" => 4, "AY" => 8, "AZ" => 3, "BX" => 1, "BY" => 5, "BZ" => 9, "CX" => 7, "CY" => 2, "CZ" =>6 };
    var win = { 'A' => "Y", 'B' => "Z", 'C' => "X" };
    var draw = { 'A' => "X", 'B' => "Y", 'C' => "Z" };
    var lose = { 'A' => "Z", 'B' => "X", 'C' => "Y" };
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
        var nstr;
        var chrs;
        var a;
        var b;
        var c;
        var s;
        var finished = false;
        var wdcnt = 0;
        while (wdcnt < 300) {
            if (me.i == me.cent) {
                finished = true;
                break;
            }
            nstr = ns.substring(me.i, me.i+3);
            chrs = nstr.toCharArray();
            a = chrs[0];
            c = chrs[2];
            if (me.part == 1) {
                b = c;
            } else {  // me.part == 2
                if (c == 'X') {
                    b = me.lose[a];
                } else if (c == 'Y') {
                    b = me.draw[a];
                } else {  // c == "Z"
                    b = me.win[a];
                }
            }
            s = me.Score[a+b];
            me.res += s;
            me.i += 4;
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