//router/pacienteRouter.js
const express= require('express');
const router= express.Router();
const pacienteControlador= require('../controlador/pacienteControlador');

//Definir la ruta para mostrar los pacientes
router.get('/', pacienteControlador.obtenerPacientes);

module.exports= router;
