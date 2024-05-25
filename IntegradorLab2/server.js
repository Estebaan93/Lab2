const express= require('express');
const {createConnection}= require('./connection/connectionBD');
const app= express();

//Routers
const pacienteRoutes= require('./routes/pacienteRoutes');
const indexRouter= require('./routes/index');

//Conectar a la base de datos
createConnection();

app.set('view engine', 'pug')
app.use(express.urlencoded({extended: true}));
// app.use(bodyParser.json());
app.use(express.static('public'));

//Usar los enrutadores
app.use('/', indexRouter);
app.use('/nuevo_paciente',pacienteRoutes);
app.use('/lista_paciente',pacienteRoutes);
app.use('/delete/:id',pacienteRoutes);



const PORT= process.env.PORT || 3002;
app.listen(PORT, ()=>{
	console.log(`Servidor corriendo en el localhost:${PORT}`)
});

