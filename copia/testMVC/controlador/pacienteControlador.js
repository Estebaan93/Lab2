//controlador/pacienteControlador.js
const pacienteModelo= require('../modelo/pacienteModelo');

//Constrolador para mostrar los pacientes
const obtenerPacientes= (req, res)=>{
 pacienteModelo.obtenerPacientes((error,resultado)=>{
  if(error){
   console.error(`Error al obtener los pacientes: ${error}`);
   return res.status(500).send(`Error en la consulta: ${error}`);
  }

  //Renderizamos la vista pacientes.pug y pasar los resultados
  res.render('pacientes',{pacientes: resultado});
 });
};


module.exports= {
 obtenerPacientes
};
