// medicamentoRouter.js

const express = require('express');
const router = express.Router();
const medicamentoController = require('../controller/medicamentoController');

// Ruta para guardar un medicamento
router.post('/', medicamentoController.guardarMedicamento);

// Ruta para listar todos los medicamentos
router.get('/', medicamentoController.listarMedicamentos);

// Ruta para actualizar un medicamento
router.put('/:id_medicamento', medicamentoController.actualizarMedicamento);

// Ruta para eliminar un medicamento
router.delete('/:id_medicamento', medicamentoController.eliminarMedicamento);

//Ruta para buscar medicamentos
router.get('/buscar', medicamentoController.buscarMedicamentos);

//Ruta para crear medicamento
router.get('/crearMedicamento', (req, res)=>{
    res.render('crearMedicamento');
})

module.exports = router;
