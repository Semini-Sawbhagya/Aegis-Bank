import express from 'express';
import mysql from 'mysql';

const app = express();

const db = mysql.createConnection({
  host: 'localhost',
  user: "root",
  password: "123456",
  database: "bank_database",
});

// Check if the database connection is successful
db.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err);
    return;
  }
  console.log('Connected to the database successfully!');
});

app.get("/account", (req, res) => {
  const query = "SELECT * FROM account";
  db.query(query, (err, result) => {
    if (err) {
      console.log(err);
      res.status(500).send('Error querying database');
      return;
    }
    res.json(result);
  });
});

// A simple route to test if the server is running
app.get('/', (req, res) => {
  res.send('Hello, Aegis Bank!');
});

// Start the server on port 3000
app.listen(3000, () => {
  console.log('Connected to backend');
});
