import Toybox.Lang;
import Toybox.Timer;
import Toybox.System;
import Toybox.WatchUi;


class Solver05 extends Solver {

    var S;
    var i;

    function initialize(app, input) {
        Solver.initialize(app, input);
    }

    function solve(part) {
        me.S = [];
        me.part = part;
        me.cent = me.input.length();
        me.app.initiateProgress();
        me.prepare();
        me.iterate();
    }

    function continueSolving() {
        iterate();
    }

    function prepare() {
        var iprep = me.input.find("1");
        var prep = me.input.substring(0, iprep).toCharArray();
        var maxheight = (iprep - 1) / 36;  // 36 chars per line
        for (var col = 1; col <= 33; col += 4) {
            var stack = [];
            for (var row = maxheight.toNumber() - 1; row >= 0; row--) {
                var c = prep[row*36+col];
                if (c != ' ') {
                    stack.add(c);
                }
            }
            me.S.add(stack);
        }
        me.i = iprep+36; // +35 to get to the beginning of the empty line, +1 for '\n'
    }

    function iterate() {
        var ns = me.input;
        var searchstr;
        var iSpace;
        var line;
        var in;
        var n;
        var a;
        var b;
        var finished = false;
        var wdcnt = 0;
        while (wdcnt < 200) {
            searchstr = ns.substring(me.i, me.i+22);
            iSpace = searchstr.find("\n");
            if (iSpace == null) {
                finished = true;
                break;
            }
            line = searchstr.substring(0, iSpace);
            in = line.find(" f");
            n = line.substring(5, in).toNumber();
            a = line.substring(in+6, in+7).toNumber();
            b = line.substring(in+11, in+12).toNumber();
            if (me.part == 1) {
                for (var i = 0; i < n; i++) {
                    var astack = me.S[a-1];
                    var elem = astack[astack.size()-1];
                    me.S[a-1] = astack.slice(0, -1);
                    me.S[b-1].add(elem);
                }
            } else {
                var astack = me.S[a-1];
                var elems = astack.slice(-n, null);
                me.S[a-1] = astack.slice(0,-n);
                me.S[b-1].addAll(elems);
            }
            me.i += iSpace + 1;
            wdcnt += 1;
        }
        if (finished) {
            var res = "";
            for (var i = 0; i < me.S.size(); i++) {
                res += me.S[i][me.S[i].size()-1].toString();
            }
            app.result = res;
            app.onResult();
            return;
        }
        me.percent = me.i.toFloat() / me.cent * 100;
        me.timer.start(method(:reportProgress), 50, false);
    }
}