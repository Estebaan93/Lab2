const express = require('express');
const fs = require('fs');
const path = require('path');
const animales= require('./animalesEj4');
const {leerNoticiasJson, guardarNoticias, leerCategoria}=require('./appNoticias');


const app = express();

// Configura Pug como motor de vistas
app.set('view engine', 'pug');
// AVERIGUAR ESTE APP SET PARA QUE ES
app.set('views', './views');


const pugFile = './views/Ej5.pug'; // Nombre de tu archivo Pug
const outputFile = './public/index.html'; // Nombre del archivo HTML generado

//Carpeta src de img
app.use(express.static('public/src'));
console.log(animales);

// Compilar el archivo Pug
const compiledFunction = require('pug').compileFile(pugFile);


//Middleware para parsear el cuerpo de las solicitudes POST
 app.use(express.urlencoded({entended: true}));

//Ejercicio 5 mostrar noticias
const noticias= leerNoticiasJson();
console.log(noticias);

//Ruta para el formulario de nueva noticia
app.get('/noticias/noticiasInsertar', (req, res)=>{
  const categorias=leerCategoria();
  res.render('noticiasInsertar', {categorias});
});

app.get('/', (req,res)=>{
  console.log("Servidor iniciado");
})


//Ruta para agregar noticia nueva
app.post('/noticias/agregar', (req, res)=>{
  const {titulo, descripcion, categoria, fecha, url_imagen}= req.body;
  const nuevaNoticia={
    titulo,
    descripcion,
    categoria,
    fecha,
    url_imagen
  };

  try{
    const noticias= leerNoticiasJson();
    noticias.push((nuevaNoticia));
    guardarNoticias(noticias);
    res.redirect('/');
  } catch (error){
    console.error('Error al agregar noticia:', error);
    res.status(500).send('Error interno al agregar la noticia');
  }
});

// Generar HTML compilado
const html = compiledFunction({noticias});  //Ej4 {animles} //Ej5 {noticias}


// Escribir el resultado HTML en un archivo
fs.writeFileSync(outputFile, html, 'utf8');

// Servir el archivo HTML estático
app.use(express.static(path.join(__dirname, '/public')));

// Iniciar el servidor
const PUERTO = process.env.PUERTO || 3002;
app.listen(PUERTO, () => {
  console.log(`Servidor escuchando en http://localhost:${PUERTO}`);
});
