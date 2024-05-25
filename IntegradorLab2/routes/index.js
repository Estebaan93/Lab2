const express = require('express');
const router = express.Router();

// Ruta para la página de inicio
router.get('/', (req, res) => {
  res.render('index');
});

router.get('/nuevo_paciente',(req, res)=>{
 res.render('nuevo_paciente');
});




module.exports = router;
