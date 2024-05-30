const express = require('express');
const router = express.Router();
const pacienteController = require('../controllers/pacienteControl');
const Paciente= require('../models/pacienteModel');

// Ruta para listar pacientes
router.get('/', pacienteController.obtenerPaciente);

// Ruta para añadir nuevos pacientes
router.post('/add', pacienteController.crearPaciente);

// Ruta para eliminar pacientes
router.put('/delete/:id', pacienteController.eliminarPaciente);

router.get('/listaPaciente', pacienteController.obtenerPaciente);

router.get('/nuevoPaciente', pacienteController.crearPaciente);


// Ruta para editar pacientes
router.get('/edit/:id', (req, res) => {
  const { id } = req.params;
  Paciente.obtenerPaciente((err, pacientes) => {
    if (err) {
      return res.status(500).send(err);
    }
    const pacienteAEditar = pacientes.find(paciente => paciente.id == id);
    res.render('editar_paciente', { paciente: pacienteAEditar });
  });
});


// Ruta para actualizar pacientes
router.post('/edit/:id', pacienteController.actualizarPaciente);

module.exports = router;
