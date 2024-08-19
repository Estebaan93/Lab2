// medicamentoController.js

const createConnection = require('../js/config');
// const { guardarEdicionPaciente } = require('./pacienteController');

// Función para guardar un medicamento
const guardarMedicamento = async (req, res) => {
  let conexion;
  try {
    conexion = await createConnection();
    // Insertar el medicamento en la base de datos
    const { nombre_generico, nombre_comercial, id_categoria, id_familia, activo } = req.body;
    const medicamentoQuery = `
            INSERT INTO medicamento (nombre_generico, nombre_comercial, id_categoria, id_familia, activo)
            VALUES (?, ?, ?, ?, ?)
        `;
    const medicamentoValues = [nombre_generico, nombre_comercial, id_categoria, id_familia, 1];
    await conexion.query(medicamentoQuery, medicamentoValues);
    res.redirect('/Medicamento?mensajeExito=Medicamento agregado correctamente');
  } catch (error) {
    console.error(error);
    res.status(500).json({ mensaje: 'Error al agregar medicamento' });
  } finally {
    if (conexion) await conexion.end();
  }
};

// Función para obtener categorías desde la base de datos
const getCategorias = async () => {
  try {
    const connection = await mysql.createConnection(dbConfig);
    const [rows] = await connection.execute('SELECT * FROM categoria');
    await connection.end();
    return rows; // Devuelve un array de categorías obtenidas
  } catch (error) {
    console.error('Error al obtener categorías:', error);
    throw error; // Manejo de errores o lanzamiento de excepciones
  }
};

// Función para obtener todos los medicamentos con detalles
const listarMedicamentos = async (req, res) => {
  let conexion;
  try {
    conexion = await createConnection();
    const [medicamentos] = await conexion.query(`
      SELECT
        m.id_medicamento,
        m.nombre_generico,
        m.nombre_comercial,
        m.activo,
        c.categoria AS categoria,
        f.familia AS familia
        FROM
        medicamento m
        JOIN
        categoria c ON m.id_medicamento=c.id_categoria
        JOIN
        familia f ON m.id_familia=f.if_familia
         `);
    //res.json(medicamentos);
    res.render('Medicamentos', { medicamentos, mensajeExitoso: req.query });
  } catch (error) {
    console.error('Error al listar medicamentos:', error);
    res.status(500).send('Error al listar medicamentos');
  } finally {
    if (conexion) await conexion.end();
  }
};

// Función para actualizar un medicamento
const actualizarMedicamento = async (req, res) => {
  const { id_medicamento } = req.params;
  const { nombre_generico, nombre_comercial, id_categoria, id_familia, activo } = req.body;

  try {
    const connection = await createConnection();

    // Actualizar el medicamento en la base de datos
    const query = `
            UPDATE medicamento
            SET nombre_generico = ?, nombre_comercial = ?, id_categoria = ?, id_familia = ?, activo = ?
            WHERE id_medicamento = ?
        `;
    await connection.query(query, [nombre_generico, nombre_comercial, id_categoria, id_familia, activo, id_medicamento]);

    await connection.end();

    res.send('Medicamento actualizado correctamente');
  } catch (error) {
    console.error('Error al actualizar medicamento:', error);
    res.status(500).send('Error al actualizar medicamento');
  }
};

// Función para eliminar un medicamento
const eliminarMedicamento = async (req, res) => {
  const { id_medicamento } = req.params;

  try {
    const connection = await createConnection();

    // Eliminar el medicamento de la base de datos
    const query = 'DELETE FROM medicamento WHERE id_medicamento = ?';
    await connection.query(query, [id_medicamento]);

    await connection.end();

    res.send('Medicamento eliminado correctamente');
  } catch (error) {
    console.error('Error al eliminar medicamento:', error);
    res.status(500).send('Error al eliminar medicamento');
  }
};

module.exports = {
  guardarMedicamento,
  getCategorias,
  listarMedicamentos,
  actualizarMedicamento,
  eliminarMedicamento,
};
