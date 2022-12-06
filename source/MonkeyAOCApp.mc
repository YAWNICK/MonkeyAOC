import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class MonkeyAOCApp extends Application.AppBase {

    var day;
    var part;
    var solver;
    var result;
    var state;
    var msg;


    function initialize() {
        AppBase.initialize();
        me.state = 0;
    }

    function startSolving() {
        me.solver.solve(me.part);
    }

    function initiateProgress() {
        me.state = 2;
        me.msg = "0.00 %";
        WatchUi.requestUpdate();
    }

    function onProgress(progress) {
        me.msg = progress + " %";
        WatchUi.requestUpdate();
        me.solver.continueSolving();
    }

    function onResult() {
        me.state = 3;
        WatchUi.requestUpdate();
    }

    function onInputLoaded(responseCode, data) {
        System.println(responseCode);
        selectSolver(data);
        me.state = 1;
        WatchUi.requestUpdate();
    }

    function selectSolver(data) {
        switch (me.day) {
            case 1:
                me.solver = new Solver01(me, data);
                break;
            case 2:
                me.solver = new Solver02(me, data);
                break;
            case 3:
                me.solver = new Solver03(me, data);
                break;
            case 4:
                me.solver = new Solver04(me, data);
                break;
            case 5:
                me.solver = new Solver05(me, data);
                break;
            case 6:
                me.solver = new Solver06(me, data);
                break;
            default:
                break;
        }
    }

    function loadInput() {
        var token = WatchUi.loadResource(Rez.Strings.Token);
        var cookie = "session=" + token;
        var url = "https://adventofcode.com/2022/day/" + me.day + "/input";
        var options = {
            :method => Communications.HTTP_REQUEST_METHOD_GET,
            :headers => {
                "Cookie" => cookie
            },
        };
        Communications.makeWebRequest(url, null , options, method(:onInputLoaded));
    }

    function next() {
        if (self.state == 0) {
            if (me.day == null or me.part == null) {
                return;
            }
            self.loadInput();
        } else if (self.state == 1) {
            self.startSolving();
        }
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new MonkeyAOCView(me), new MonkeyAOCDelegate(me) ] as Array<Views or InputDelegates>;
    }

}

function getApp() as MonkeyAOCApp {
    return Application.getApp() as MonkeyAOCApp;
}