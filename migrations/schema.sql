CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  name VARCHAR(128),
  email VARCHAR(128) UNIQUE NOT NULL,
  password_hash VARCHAR(256) NOT NULL,
  role VARCHAR(32) NOT NULL
);
CREATE TABLE bands (
  band_id SERIAL PRIMARY KEY,
  name VARCHAR(128) NOT NULL,
  manager_id INT REFERENCES users(user_id)
);
CREATE TABLE rooms (
  room_id SERIAL PRIMARY KEY,
  name VARCHAR(128),
  location VARCHAR(128),
  capacity INT
);
CREATE TABLE bookings (
  booking_id SERIAL PRIMARY KEY,
  room_id INT REFERENCES rooms(room_id),
  user_id INT REFERENCES users(user_id),
  band_id INT REFERENCES bands(band_id),
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  status VARCHAR(32)
);
CREATE TABLE payments (
  payment_id SERIAL PRIMARY KEY,
  booking_id INT REFERENCES bookings(booking_id),
  amount NUMERIC,
  status VARCHAR(32)
);
CREATE TABLE notifications (
  notification_id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(user_id),
  type VARCHAR(32),
  message TEXT,
  timestamp TIMESTAMP DEFAULT NOW()
);