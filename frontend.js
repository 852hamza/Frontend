require('dotenv').config(); // Load environment variables from .env file
const axios = require('axios');
const express = require('express');
const app = express();
const port = 3001;

app.get('/', async (req, res) => {
  try {
    const response = await axios.get(`${process.env.BACKEND_URL}/api/hello`);
    const currentTime = new Date().toLocaleString();
    const message = `${currentTime} ${response.data}`;
    res.send(message);
  } catch (error) {
    console.error(error);
    res.status(500).send('Error occurred');
  }
});

app.listen(port, () => {
  // console.log(`Backend server is running on port ${port}`);
});