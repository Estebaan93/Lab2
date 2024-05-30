const express = require('express');
const router = express.Router();
const indexController= require ('../controllers/indexController');
const ensureAuthenticated= require('../middlewares/ensureAuthenticated');


router.get('/', indexController.showHomePage);
router.get('/dashboard', ensureAuthenticated, indexController.showDashboard);

// Ruta para la página de inicio
// router.get('/', (req, res) => {
//   res.render('index');
// });

router.get('/nuevoPaciente',(req, res)=>{
 res.render('nuevoPaciente');
});




module.exports = router;
