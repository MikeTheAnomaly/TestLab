import url from "url";
import express from "express";
import mysql, { Query } from "mysql";
const app = express();

var sqlConnection = mysql.createConnection({
  host: "127.0.0.1",
  user: "exampleuser",
  password: "password",
  database: "exampleschool"
});

sqlConnection.connect(function(err) {
  if (err) {
    throw err;
  } else {
    console.log("connected to mysql");
  }
});

app.get("/", function(req, res) {
  const getParameters = url.parse(req.url || "", true).query;
  console.log("get parameters are: ", getParameters + " from: " + req.ip);
  if (getParameters.factorialof) {
    //mysql connection & query here....
    const factorialof: number = Number.parseInt(
      getParameters.factorialof as string
    );

    res.send(
      "the factorial of " + factorialof + " is " + factorial(factorialof)
    );
  } else if (getParameters.table) {
    const tableName: string = getParameters.table as string;
    sendTable(tableName,res);
  } else {
    res.send("set factorialof in get params porfavor!");
  }
});
const port = 3000;
app.listen(port);

function sendTable(tableName: string,res:any):void {
  sqlConnection.query("SELECT * FROM " + tableName, function(err,result,fields
  ) {
    if (err) {
      res.send("ARRR that table does not exist matey");
    } else {
      console.log(result);
      res.send(result);
    }
  });
  
}

function factorial(x: number): number {
  for (let i = x - 1; i > 0; i--) {
    x *= i;
  }
  return x;
}
