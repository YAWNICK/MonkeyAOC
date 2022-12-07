import Toybox.Lang;
import Toybox.Timer;
import Toybox.System;
import Toybox.WatchUi;


class Solver07 extends Solver {

    var S;  // Sizes
    var Stack;
    var i;

    function initialize(app, input) {
        Solver.initialize(app, input);
    }

    function solve(part) {
        me.S = {};
        me.Stack = ["/"];
        me.i = 7;
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
        var fsize;
        var finished = false;
        var wdcnt = 0;
        while (wdcnt < 200) {
            searchstr = ns.substring(me.i, me.i+25);
            iSpace = searchstr.find("\n");
            if (iSpace == null) {
                finished = true;
                break;
            }
            me.i += iSpace + 1;
            wdcnt += 1;
            line = searchstr.substring(0, iSpace);
            if (!line.substring(0,1).equals("$")) {
                if (line.substring(0,1).equals("d")) {continue;}
                fsize = line.substring(0, line.find(" ")).toNumber();
                var dpath = "";
                for (var i = 0; i < me.Stack.size(); i++) {
                    dpath += "/" + me.Stack[i];
                    var dpathhash = dpath.hashCode();
                    if (me.S[dpathhash] == null) {
                        me.S[dpathhash] = fsize;
                    } else {
                        me.S[dpathhash] = me.S[dpathhash] + fsize;
                    }
                }
                continue;
            }
            if (line.substring(2,4).equals("ls")) {continue;}
            if (line.substring(5,7).equals("..")) {
                me.Stack = me.Stack.slice(0, -1);
                continue;
            }
            me.Stack.add(line.substring(5,iSpace));
        }
        if (finished) {
            var res = 0;
            var dsizes = me.S.values();
            if (me.part == 1) {
                for (var i = 0; i < dsizes.size(); i++) {
                    if (dsizes[i] <= 100000) {
                        res += dsizes[i];
                    }
                }
            } else {
                var sn = me.S["//".hashCode()] - 40000000;
                res = 30000000;
                for (var i = 0; i < dsizes.size(); i++) {
                    var s = dsizes[i];
                    if (s >= sn && s < res) {
                        res = s;
                    }
                }
            }

            app.result = res;
            app.onResult();
            return;
        }
        me.percent = me.i.toFloat() / me.cent * 100;
        me.timer.start(method(:reportProgress), 50, false);
    }
}