const express = require('express');
const fs = require('fs');
const path = require('path');

const app = express();
const port = 3002;

const pugFile = './views/Ej3.pug'; // Nombre de tu archivo Pug
const outputFile = './public/index.html'; // Nombre del archivo HTML generado

// Compilar el archivo Pug
const compiledFunction = require('pug').compileFile(pugFile);

// Generar HTML compilado
const html = compiledFunction();

// Escribir el resultado HTML en un archivo
fs.writeFileSync(outputFile, html, 'utf8');

// Servir el archivo HTML estático
app.use(express.static(path.join(__dirname, '/public')));

// app.get('/', (req, res)=>{
//   res.send()
// })

// Iniciar el servidor
app.listen(port, () => {
  console.log(`Servidor escuchando en http://localhost:${port}`);
});
