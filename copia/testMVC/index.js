//index.js
const express= require('express');
const app= express();
const session= require('express-session');
const path= require('path');


//Importar rutas
const medicamentoRouter= require('./router/medicamentoRouter');
const pacienteRouter= require('./router/pacienteRouter');
const usuarioRouter= require('./router/usuarioRouter');

//Configurar pug como motor de vistas
app.set('view engine', 'pug');
app.set('views', './vista');

//Rutas
app.use('/medicamentos', medicamentoRouter);
app.use('/pacientes', pacienteRouter);
app.use('/Usuarios',usuarioRouter);

//Ruta principal
app.get('/', (req,res)=>{
  res.render('index',{usuario: req.session.usuario});
});

const port=3000;
app.listen(port,()=>{
  console.log(`Servidor iniciado en el puerto ${port}`);
});



