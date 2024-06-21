const express = require('express');
const path = require('path');
const mysql = require('mysql2');
const app = express();

// Crear la conexión a la base de datos
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',  // Reemplaza con tu contraseña de MySQL
  database: 'consultorio_medico_lab2'
});

// Conectar a la base de datos
db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log('MySQL Connected...');
});

// Configurar el motor de plantillas
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

// Middleware para archivos estáticos
app.use(express.static(path.join(__dirname, 'public')));

// Ruta para la página de inicio
app.get('/', (req, res) => {
  const query = 'SELECT * FROM paciente';
  db.query(query, (err, results) => {
    if (err) throw err;
    res.render('index', { title: 'Pacientes', patients: results });
  });
});

// Ruta de búsqueda
app.get('/search', (req, res) => {
  const searchTerm = req.query.q;
  const query = `
    SELECT * FROM paciente 
    WHERE apellido LIKE ? OR nombre LIKE ? OR documento LIKE ?
  `;
  db.query(query, [`%${searchTerm}%`, `%${searchTerm}%`, `%${searchTerm}%`], (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

// Iniciar el servidor
const PORT = process.env.PORT || 3005;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
