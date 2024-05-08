const pug = require('pug');
const fs = require('fs');

const pugFile = 'ej3.pug'; // Nombre de tu archivo Pug
const outputFile = 'index.html'; // Nombre del archivo HTML generado

// Compilar el archivo Pug
const compiledFunction = pug.compileFile(pugFile);

// Escribir el resultado HTML en un archivo
fs.writeFileSync(outputFile, compiledFunction(), 'utf8');

console.log('Archivo Pug compilado exitosamente.');
