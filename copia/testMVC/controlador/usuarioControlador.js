//usuarioControlador.js

const bcrypt = require("bcrypt");
const createConnection = require("../base/dbConexion");
const saltRounds = 10;

//Funcion para mostrar el formulario de registro
exports.mostrarRegistro = (req, res) => {
  res.render("usuario/registro");
};

//Funcion para registrar nuevos usuarios
exports.registrarUsuario= async(req,res)=>{
  const {nombre, apellido, funcion, usuario, password, documento}= req.body;
}
