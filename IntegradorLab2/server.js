// server.js

const express = require('express');
const session = require('express-session');
const { createConnection } = require('./connection/connectionBD');
const app = express();
const path = require('path');

// Routers
const pacienteRoutes = require('./routes/pacienteRoutes');
const indexRouter = require('./routes/index');
const authRouter = require('./routes/auth');

// Conectar a la base de datos
createConnection().then(()=>{
    console.log('Conexion a la base de datos establecida')
    }).catch((err) => {
    console.error('No se pudo conectar a la base de datos:', err);
});

app.set('view engine', 'pug');

// Middleware
app.use(express.static(path.join(__dirname, 'public')));
app.use(session({
    secret: 'secret',
    resave: false,
    saveUninitialized: true
}));
app.use(express.urlencoded({ extended: true }));

// Usar los enrutadores
app.use('/', indexRouter);
app.use('/auth', authRouter);
app.use('/pacientes', pacienteRoutes); // Ruta base para pacientes

const PORT = process.env.PORT || 3002;
app.listen(PORT, () => {
    console.log(`Servidor corriendo en el localhost:${PORT}`);
});
