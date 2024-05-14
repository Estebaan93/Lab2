const connectionBD= requier('./connectionBD')


//Conectar a la base de datos
connection.connect((err)=>{
	if(err){
		console.log('error al conectarse a la base de dato', err)
		return;
	}
	console.log('Conexion exitosa');
});


//Realizar consultas
connection.query('SELECT * FROM prescripcion', (error, resultado, fields)=>{
	if(error){
		console.log('Error al realizar la consulta', error);
		return;
	}
	console.log('Resultado de la consulta', resultado);
});
connection.query('SELECT Profesional.nombre FROM Profesional INNER JOIN Prescripcion ON Profesional.id_prof = Prescripcion.id_prof', (error, resultado, fields) => {
    if (error) {
        console.log('Error al realizar la consulta', error);
        return;
    }
    console.log('Nombres de los profesionales que han realizado prescripciones:');
    resultado.forEach(row => {
        console.log(row.nombre);
    });
});



//Cerrar la conexion
connection.end();