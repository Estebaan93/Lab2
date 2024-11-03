//base/dbConexion.js
const mysql=require('mysql2/promise');

//Configurar la conexion a la base de datos
async function createConnection(){
 try{
  const connection= await mysql.createConnection({
   host: 'localhost',
   user: 'root',
   password: '',
   database: 'centro_sams'
  });
 console.log('Conexion exitosa a la base de datos');
 return connection;
}catch (err){
 console.erro('Error al conectar con la base de datos:', err);
 throw err;
 }
}

module.exports= createConnection;
