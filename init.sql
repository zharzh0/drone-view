CREATE TABLE IF NOT EXISTS drones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  model VARCHAR(100) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO drones (name, model)
VALUES
  ('Scout One', 'DJI Mini 4 Pro'),
  ('Ranger Two', 'Autel EVO Lite+');
