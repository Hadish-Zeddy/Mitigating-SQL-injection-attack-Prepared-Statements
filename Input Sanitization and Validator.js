const express = require('express');
const partials = require('express-partials');
const path = require('path');

const validator = require('validator');

const app = express();

const PORT = 4001;

app.set("views", path.join(__dirname, "/views"));
app.set("view engine", "ejs");
app.use(express.static('public'));
app.use(partials());


app.use(express.json());
app.use(express.urlencoded({extended: true}));

app.use(express.static(path.join(__dirname, "/public")));


app.get('/', (req, res) => {
  res.render('form', { emailStatus: null })
})

app.post('/submit', 
  (req, res) => {
    const response = {}

    res.json({message: response})
});
$username= $_GET['user']; // Set parameter
$stmt = $conn->prepare("SELECT * FROM Users WHERE name = '?'"); // Prepare statement
$stmt->bind_param("s", $username); // Bind parameter to SQL query
$stmt->execute(); // Execute the SQL query

app.listen(process.env.PORT || PORT, () => console.log(`Listening on http://localhost:${PORT}`) );
