const express = require('express');
const app = express();
app.use(express.json());
app.get('/api/health', (req, res) => res.json({ok:true}));
// Booking, user, room, payment routes go here
module.exports = app;