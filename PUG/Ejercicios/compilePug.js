const express = require('express');
const fs = require('fs');
const path = require('path');
const animales= require('./animales');


const app = express();


const pugFile = './views/Ej5.pug'; // Nombre de tu archivo Pug
const outputFile = './public/index.html'; // Nombre del archivo HTML generado

//Carpeta src de img
app.use(express.static('public/src'));
console.log(animales);

// Compilar el archivo Pug
const compiledFunction = require('pug').compileFile(pugFile);

// Generar HTML compilado
const html = compiledFunction({animales});

// Escribir el resultado HTML en un archivo
fs.writeFileSync(outputFile, html, 'utf8');

// Servir el archivo HTML estático
app.use(express.static(path.join(__dirname, '/public')));

// Iniciar el servidor
const PUERTO = process.env.PUERTO || 3002;
app.listen(PUERTO, () => {
  console.log(`Servidor escuchando en http://localhost:${PUERTO}`);
});
