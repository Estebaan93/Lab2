const fs=require('fs');
//Funcion para leer las noticas desde el JSON
function leerNoticiasJson () {
	try{
		const noticiasData=fs.readFileSync('noticias.json', 'UTF8');
		const noticias=JSON.parse(noticiasData);
		return noticias;
	} catch (error){
		console.error('Error al traer las noticias', error);
		return [];
	}
}

//Funcion para guardar las noticas
function guardarNoticias (noticias) {
	try{
		const data= JSON.stringify(noticias,null, 2);
		fs.writeFileSync('noticias.json', data);
		console.log('Noticas guardadas correctamente');	
	} catch (error){
		console.error('Error al guardar las noticias', error);
	}
}

//Funcion para leer desde categoria
function leerCategoria () {
	try{
		const categoriaData= fs.writeFileSync('categoria.json', 'UTF8');
		const categorias =JSON.parse(categoriaData);
		return categorias; 
	} catch (error){
		console.error('Error al leer categorias', error);
		return [];
	}
}

module.exports={leerNoticiasJson, guardarNoticias, leerCategoria};