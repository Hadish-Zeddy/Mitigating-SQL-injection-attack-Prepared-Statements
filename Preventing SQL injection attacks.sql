const express = require("express");
const path = require('path');
const sqlite3 = require("sqlite3");
const validator = require('validator');
const db = new sqlite3.Database("./db.sqlite");

const app = express();

app.use(express.json());

app.use(
 express.urlencoded({
    extended: true,
  })
);

app.use(express.static(path.join(__dirname, "/public")));

app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname + "/index.html"));
});

app.post("/info", async (req, res) => {
  const { email } = req.body;

  if (!validator.isEmail(email)) {
    res.status(200);
    res.json({message: "Invalid Email"})
    return
  }
  
  let formattedEmail = validator.trim(email);
  console.log(formattedEmail)
  formattedEmail = validator.normalizeEmail(formattedEmail);

console.log(formattedEmail)
  db.all(
    `SELECT * FROM Employee WHERE Email = '${formattedEmail}'`, (err, rows) => {
      if (rows) {
        res.status(200);
        res.json(rows);
      } else {
        res.status(200);
        res.json({ message: "No employees" });
      }
    }
  );
});

app.listen(4001, () => {
  console.log("App running on http://localhost:4001");
});