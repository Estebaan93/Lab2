//modelo/medicamentoModelo.js
const createConnection= require('../base/dbConexion');

// Función para obtener los medicamentos
const obtenerMedicamentos = async (callback) => {
 try{
   const conexion = await createConnection(); // Espera la creación de la conexión
    const query = `
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
        categoria c ON m.id_medicamento = c.id_categoria
      JOIN 
        familia f ON m.id_familia = f.id_familia;
    `;
 const [results]= await conexion.query(query);
 callback(null,results);
 }catch (error){
  console.error('Error en la consulta SQL:', error); 
  callback(error, null);
 }
};


module.exports= {
 obtenerMedicamentos
};
