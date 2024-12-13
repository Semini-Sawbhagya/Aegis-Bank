import express from 'express';
import mysql from 'mysql2';

const app = express();

// Middleware to parse JSON data
app.use(express.json());

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '123456',
  database: 'bank_database',
});

// Check if the database connection is successful
db.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err);
    return;
  }
  console.log('Connected to the database successfully!');
});

// GET route to fetch all accounts
app.get('/account', (req, res) => {
  const query = 'SELECT * FROM account';
  db.query(query, (err, data) => {
    if (err) {
      console.error('Error querying database:', err);
      res.status(500).send('Error querying database');
      return;
    }
    res.json(data); // Send the fetched data as JSON
  });
});

// POST route to add a new account
app.post('/account', (req, res) => {
  const { account_type, account_number, customer_id, branch_id, balance, status } = req.body;

  if (!account_type || !account_number || !customer_id || !branch_id || !balance || !status) {
    return res.status(400).send('Missing required fields');
  }

  const query = `
    INSERT INTO account (account_type, account_number, customer_id, branch_id, balance, status)
    VALUES (?, ?, ?, ?, ?, ?)
  `;

  db.query(query, [account_type, account_number, customer_id, branch_id, balance, status], (err, data) => {
    if (err) {
      console.error('Error inserting data into database:', err);
      res.status(500).send('Error inserting data into database');
      return;
    }
    res.status(201).send('Account created successfully!');
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
