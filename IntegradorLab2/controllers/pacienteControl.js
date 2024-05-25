const Paciente = require('../models/pacienteModel');

// Obtener pacientes
exports.obtenerPaciente = (req, res) => {
  Paciente.obtenerPaciente((err, pacientes) => {
    if (err) {
      return res.status(500).send(err);
    }
    res.render('lista_paciente', { paciente: pacientes }); // Renderizar la vista correcta
  });
};


// Crear paciente
exports.crearPaciente = (req, res) => {
  const { apellido, nombre, documento, fecha_nacimiento, sexo, id_obra_social } = req.body;
  const data = { apellido, nombre, documento, fecha_nacimiento, sexo, id_obra_social };
  
  Paciente.crearPaciente(data, (err, resultado) => {
    if (err) {
      console.error('Error al agregar paciente', err);
      return res.status(500).send(err);
    }
    res.redirect('lista_paciente'); // Corregir la ruta aquí
  });
};


// Actualizar paciente
exports.actualizarPaciente = (req, res) => {
  const { id } = req.params;
  const { nombre, apellido, dni, fecha_nac, sexo, obra_social, plan, estado } = req.body;
  const data = { nombre, apellido, dni, fecha_nac, sexo, obra_social, plan, estado };
  
  Paciente.actualizarPaciente(id, data, (err, resultado) => {
    if (err) {

      return res.status(500).send(err);
    }
    res.redirect('/ListarPacientes');
  });
};

// Eliminar paciente
exports.eliminarPaciente = (req, res) => {
  const { id } = req.params;
  
  Paciente.eliminarPaciente(id, (err, resultado) => {
    if (err) {
      console.error('Error al eliminar paciente:', err);
      return res.status(500).send(err);
    }
    res.redirect('lista_paciente');
  });
};
