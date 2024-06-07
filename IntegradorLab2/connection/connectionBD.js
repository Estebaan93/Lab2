const mysql = require('mysql2');

// Configuración de la conexión a la base de datos
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'bit_laboratorio',
  // port: 3306   //Opcional no hace falta
});


// connection.connect((err)=>{
//   if(err){
//     console.error('Error conectandose a la base de datos:', err.stack);
//     return;
//   }
//   // console.log('Conectandose a la base de datos con el id', connection.threadId);  
// });


const createConnection = () => {
  return new Promise((resolve, reject) => {
    connection.connect((err) => {
      if (err) {
        // Maneja el error en caso de que no se pueda conectar a la base de datos
        console.error('Error al conectarse con mysql:', err);
        reject(err);
      } else {
        // Maneja cuando se logra conectar a la base de datos
        console.log('Conexion exitosa');
        resolve();
      }
    });
  });
};

module.exports = {connection, createConnection};

