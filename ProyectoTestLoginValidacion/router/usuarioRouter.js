// router/usuarioRouter.js
const express = require('express');
const router = express.Router();
const usuarioController = require('../controller/usuarioController');

router.get('/registro', usuarioController.mostrarRegistro);
router.post('/registro', usuarioController.registrarUsuario);
router.get('/login', usuarioController.mostrarLogin);
router.post('/login', usuarioController.procesarLogin);
router.get('/logout', usuarioController.logout);

module.exports = router;
