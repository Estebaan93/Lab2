const db = require('../connection/connectionBD');
const bcrypt = require('bcrypt');

const User = {
  create: (username, password, role, callback) => {
    const hashedPassword = bcrypt.hashSync(password, 8);
    db.query('INSERT INTO users (username, password, role) VALUES (?, ?, ?)', [username, hashedPassword, role], callback);
  },
  findByUsername: (username, callback) => {
    db.query('SELECT * FROM users WHERE username = ?', [username], (err, results) => {
      if (err) return callback(err);
      callback(null, results[0]);
    });
  },
  ensureAdminUser: (callback) => {
    const adminUsername = 'admin';
    const adminPassword = bcrypt.hashSync('admin123', 8);
    const adminRole = 'admin';

    User.findByUsername(adminUsername, (err, user) => {
      if (err) return callback(err);

      if (!user) {
        User.create(adminUsername, adminPassword, adminRole, callback);
      } else {
        callback(null, user);
      }
    });
  },
  comparePassword: (inputPassword, storedPassword) => {
    return bcrypt.compareSync(inputPassword, storedPassword);
  }
};

module.exports = User;
