// index.js
const express = require('express');
const path = require('path');
const session = require('express-session');
const app = express();

// Configurar Pug como motor de plantillas
app.set('view engine', 'pug');
app.set('views', path.join(__dirname, 'views'));

// Configuración de archivos estáticos
app.use(express.static(path.join(__dirname, 'public')));

// Middleware para analizar el cuerpo de las solicitudes
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Configurar sesiones
app.use(session({
  secret: 'secreto', // Cambia esto por una cadena secreta segura
  resave: false,
  saveUninitialized: true
}));

// Importar las rutas
const usuarioRouter = require('./router/usuarioRouter');

// Usar las rutas
app.use('/Usuarios', usuarioRouter);

// Ruta para la página principal
app.get('/', (req, res) => {
  res.render('index', { usuario: req.session.usuario });
});

// Ruta para el dashboard (protegida)
app.get('/dashboard', (req, res) => {
  if (req.session.loggedin) {
    res.render('dashboard', { usuario: req.session.usuario });
  } else {
    res.redirect('/Usuarios/login');
  }
});

// Iniciar el servidor
app.listen(3002, () => {
  console.log('Servidor iniciado en http://localhost:3002');
});
