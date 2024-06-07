// controller/usuarioController.js
const bcrypt = require('bcrypt');
const db = require('../js/db');

exports.mostrarRegistro = (req, res) => {
  res.render('registro');
};

exports.registrarUsuario = async (req, res) => {
  const { usuario, password } = req.body;
  const hashedPassword = await bcrypt.hash(password, 10);

  db.query("INSERT INTO usuarios (usuario, password) VALUES (?, ?)", [usuario, hashedPassword], (err) => {
    if (err) {
      console.error('Error al registrar el usuario:', err);
      res.send('Error al registrar el usuario.');
    } else {
      res.redirect('/Usuarios/login');
    }
  });
};

exports.mostrarLogin = (req, res) => {
  res.render('login');
};

exports.procesarLogin = (req, res) => {
  const { usuario, password } = req.body;

  db.query("SELECT * FROM usuarios WHERE usuario = ?", [usuario], async (err, results) => {
    if (err) {
      console.error('Error al procesar el inicio de sesión:', err);
      res.send('Error al procesar el inicio de sesión.');
    } else if (results.length > 0 && await bcrypt.compare(password, results[0].password)) {
      req.session.loggedin = true;
      req.session.usuario = results[0].usuario;
      res.redirect('/dashboard');
    } else {
      res.send('Datos de inicio de sesión incorrectos.');
    }
  });
};

exports.mostrarDashboard = (req, res) => {
  if (req.session.loggedin) {
    res.render('dashboard', { usuario: req.session.usuario });
  } else {
    res.redirect('/Usuarios/login');
  }
};

exports.logout = (req, res) => {
  req.session.destroy((err) => {
    if (err) {
      return res.send('Error al cerrar sesión.');
    }
    res.redirect('/Usuarios/login');
  });
};
