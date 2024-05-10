const mysql= require ('mysql2');

//Configuracion de la conexion
const connection= mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: '',
	database: 'bit_laboratorio'
});


//Conectar a la base de datos
connection.connect((err)=>{
	if(err){
		console.log('error al conectarse a la base de dato', err)
		return;
	}
	console.log('Conexion exitosa');
});


//Realizar consultas
connection.query('SELECT * FROM medicamentos', (error, resultado, fields)=>{
	if(error){
		console.log('Error al realizar la consulta', error);
		return;
	}
	console.log('Resultado de la consulta', resultado);
});


//Cerrar la conexion
connection.end();