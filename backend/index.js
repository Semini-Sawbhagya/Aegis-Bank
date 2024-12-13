import express from 'express';

const app = express();

// A simple route to test if the server is running
app.get('/', (req, res) => {
  res.send('Hello, Aegis Bank!');
});

// Start the server on port 3000
app.listen(3000, () => {
  console.log('Connected to backend');
});
