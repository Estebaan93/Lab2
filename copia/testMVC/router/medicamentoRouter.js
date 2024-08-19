//router/medicamentoRouter.js
const express= require('express');
const router= express.Router();
const medicamentoController= require('../controlador/medicamentoControl');

//Definir la ruta para mostrar los medicamentos
router.get('/', medicamentoController.mostrarMedicamentos);

module.exports= router;
