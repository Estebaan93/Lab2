const { connection } = require('../connection/connectionBD');

const obtenerPaciente = (callback) => {
  connection.query('SELECT * FROM paciente', (err, resultado) => {
    if (err) {
      return callback(err);
    }
    callback(null, resultado);
  });
};

const crearPaciente = (data, callback) => {
  const { apellido, nombre, documento, fecha_nacimiento, sexo, id_obra_social } = data;
  connection.query(
    'INSERT INTO paciente (apellido, nombre, documento, fecha_nacimiento, sexo, id_obra_social) VALUES (?, ?, ?, ?, ?, ?)',
    [apellido, nombre, documento, fecha_nacimiento, sexo, id_obra_social],
    (err, resultado) => {
      if (err) {
        return callback(err);
      }
      callback(null, resultado);
    }
  );
};

const actualizarPaciente = (id_paciente, data, callback) => {
  const { nombre, apellido, dni, fecha_nac, sexo, obra_social, plan, estado } = data;
  connection.query(
    'UPDATE paciente SET nombre = ?, apellido = ?, documento = ?, fecha_nacimiento = ?, sexo = ?, id_obra_social = ?, plan = ?, estado = ? WHERE id_paciente = ?',
    [nombre, apellido, dni, fecha_nac, sexo, obra_social, plan, estado, id_paciente],
    (err, results) => {
      if (err) {
        return callback(err);
      }
      callback(null, results);
    }
  );
};

const eliminarPaciente = (id_paciente, callback) => {
  //Verificar el id del paciente
  if(!id_paciente){
    const error= new Error('ID del paciente no es valido');
    console.error('Error al eliminar al paciente', error);
    return callback(error);
  }
  connection.query(
    'UPDATE paciente SET activo = FALSE WHERE id_paciente=?',
    [id_paciente],
    (err, resultado) => {
      if (err) {
        console.error('Error al eliminar paciente desde el modelo:', err);
        return callback(err);
      }
      callback(null, resultado);
    }
  );
};

module.exports = { obtenerPaciente, crearPaciente, actualizarPaciente, eliminarPaciente };
