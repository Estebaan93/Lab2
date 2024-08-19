//index.js
const express= require('express');
const app= express();
const medicamentoRouter= require('./router/medicamentoRouter');
const pacienteRouter= require('./router/pacienteRouter');

//Configurar pug como motor de vistas
app.set('view engine', 'pug');
app.set('views', './vista');

//Ruta para mostrar los medicamentos
app.use('/medicamentos', medicamentoRouter);
app.use('/pacientes', pacienteRouter);

const port=3000;
app.listen(port,()=>{
  console.log(`Servidor iniciado en el puerto ${port}`);
});
