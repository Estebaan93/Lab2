//modelo/pacienteModelo.js
const createConnection= require('../base/dbConexion');

//Funcion para obtener los pacientes
const obtenerPacientes= async (callback)=>{
 try{
  const conexion= await createConnection();
  const query =`
   SELECT
    p.*, 
    pl.descripcion AS plan_descripcion
    FROM
    paciente p
    JOIN
    plan pl ON p.id_plan= pl.id_plan
    WHERE p.estado= 1
  `;
  const [resultado]= await conexion.query(query);
  callback(null, resultado); 
 }catch(error){
  console.error(`Error en la consulta SQL pacientes: ${error}`);
  callback(error,null);
 }
};

module.exports= {
 obtenerPacientes
};
