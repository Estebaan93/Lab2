//constrolador/medicamentoControl.js
const medicamentoModelo= require('../modelo/medicamentoModelo');

//Constrolador para mostrar los medicamentos
const mostrarMedicamentos= (req,res)=>{
 medicamentoModelo.obtenerMedicamentos((error,resultado)=>{
  if(error){
   console.error(`Error al obtener los medicamentos: ${error}`);
   return res.status(500).send(`Error en la consulta: ${error}`);
  }

 //Renderizar la vista 'medicamentos.pug' y pasar los resultados
  res.render('medicamentos',{medicamentos: resultado});  
 }); 
};


module.exports={
 mostrarMedicamentos
};
