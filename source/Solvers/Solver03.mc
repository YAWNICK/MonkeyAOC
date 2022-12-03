import Toybox.Lang;
import Toybox.Timer;
import Toybox.System;
import Toybox.WatchUi;


class Solver03 {

    var app;
    var input;
    var timer;
    var part;
    var cent;
    var percent;

    var s1;
    var s2;
    var res;
    var i;
    var lcnt;

    function initialize(app, input) {
        me.app = app;
        me.input = input;
        me.timer = new Timer.Timer();
    }

    function solve(part) {
        me.s1 = 0;
        me.s2 = 0;
        me.res = 0;
        me.i = 0;
        me.lcnt = 1;
        me.part = part;
        me.cent = me.input.length();
        me.app.onProgress("0.00");
        continueSolving();
        
    }

    function continueSolving() {
        if (me.part == 1) {
            me.iterate1();
        } else {
            me.iterate2();
        }
    }

    function reportProgress() {
        me.app.onProgress(me.percent.format("%.2f"));
    }

    function iterate1() {
        var ns = me.input;
        var iSpace;
        var searchstr;
        var nstr;
        var n;
        var l;
        var r;
        var finished = false;
        var wdcnt = 0;
        while (wdcnt < 10) {
            searchstr = ns.substring(me.i, me.i+50);
            iSpace = searchstr.find("\n");
            if (iSpace == null) {
                finished = true;
                break;
            }
            nstr = searchstr.substring(0, iSpace).toCharArray();
            var lenhalf = (iSpace / 2).toNumber();
            l = nstr.slice(0, lenhalf);
            r = nstr.slice(lenhalf, iSpace);
            n = '?';
            for (var li = 0; li < lenhalf; li += 1) {
                for (var ri = 0; ri < lenhalf; ri += 1) {
                    if (l[li] == r[ri]) {
                        n = l[li];
                        break;
                    }
                }
                if (n != '?') {break;}
            }
            n = n.toNumber();
            if (n >= 97) {
                me.res += n-96;
            } else {
                me.res += n-38;
            }
            me.i = me.i + iSpace + 1;
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

    function iterate2() {
        var ns = me.input;
        var iSpace;
        var searchstr;
        var nstr;
        var n;
        var nc;
        var finished = false;
        var wdcnt = 0;
        while (wdcnt < 2) {
            searchstr = ns.substring(me.i, me.i+50);
            iSpace = searchstr.find("\n");
            if (iSpace == null) {
                finished = true;
                break;
            }
            nstr = searchstr.substring(0, iSpace).toCharArray();
            if (me.lcnt % 3 == 0) {
                var ls1 = me.s1.size();
                var ls2 = me.s2.size();
                n = '?';
                for (var s1i = 0; s1i < ls1; s1i += 1) {
                    for (var s2i = 0; s2i < ls2; s2i += 1) {
                        if (me.s1[s1i] == me.s2[s2i]) {
                            nc = me.s1[s1i];
                            for (var nstri = 0; nstri < iSpace; nstri += 1) {
                                if (nc == nstr[nstri]) {
                                    n = nc;
                                    break;
                                }
                            }
                            if (n != '?') {break;}
                        }
                    }
                    if (n != '?') {break;}
                }
                n = n.toNumber();
                if (n >= 97) {
                    me.res += n-96;
                } else {
                    me.res += n-38;
                }
                wdcnt += 1;
            }
            me.s2 = me.s1;
            me.s1 = nstr;
            me.i = me.i + iSpace + 1;
            me.lcnt += 1;
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