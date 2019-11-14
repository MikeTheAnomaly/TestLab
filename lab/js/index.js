"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var url_1 = __importDefault(require("url"));
var express_1 = __importDefault(require("express"));
var mysql_1 = __importDefault(require("mysql"));
var app = express_1.default();
var sqlConnection = mysql_1.default.createConnection({
    host: "127.0.0.1",
    user: "exampleuser",
    password: "password",
    database: "exampleschool"
});
sqlConnection.connect(function (err) {
    if (err) {
        throw err;
    }
    else {
        console.log("connected to mysql");
    }
});
app.get("/", function (req, res) {
    var getParameters = url_1.default.parse(req.url || "", true).query;
    console.log("get parameters are: ", getParameters + " from: " + req.ip);
    if (getParameters.factorialof) {
        //mysql connection & query here....
        var factorialof = Number.parseInt(getParameters.factorialof);
        res.send("the factorial of " + factorialof + " is " + factorial(factorialof));
    }
    else if (getParameters.table) {
        var tableName = getParameters.table;
        sendTable(tableName, res);
    }
    else {
        res.send("set factorialof in get params porfavor!");
    }
});
var port = 3000;
app.listen(port);
function sendTable(tableName, res) {
    sqlConnection.query("SELECT * FROM " + tableName, function (err, result, fields) {
        if (err) {
            res.send("ARRR that table does not exist matey");
        }
        else {
            console.log(result);
            res.send(result);
        }
    });
}
function factorial(x) {
    for (var i = x - 1; i > 0; i--) {
        x *= i;
    }
    return x;
}
//# sourceMappingURL=index.js.map