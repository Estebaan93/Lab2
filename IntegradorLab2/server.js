const express= require('express');
const session= require('express-session');
const {createConnection}= require('./connection/connectionBD');
const app= express();
const path = require('path');

//Routers
const pacienteRoutes= require('./routes/pacienteRoutes');
const indexRouter= require('./routes/index');

//Conectar a la base de datos
createConnection();

app.set('view engine', 'pug')

// Middleware
// app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));
app.use(session({
    secret: 'secret',
    resave: false,
    saveUninitialized: true
}));


//Analiza cuerpos de solicitud con datos URL-encoded
app.use(express.urlencoded({extended: true}));
// app.use(bodyParser.json());
app.use(express.static('public'));

const indexRouter = require('./routes/index');
const authRouter = require('./routes/auth');


//Usar los enrutadores
app.use('/', indexRouter);
app.use('/auth', authRouter);
app.use('/nuevo_paciente',pacienteRoutes);
app.use('/lista_paciente',pacienteRoutes);
app.use('/delete/:id',pacienteRoutes);




const PORT= process.env.PORT || 3002;
app.listen(PORT, ()=>{
	console.log(`Servidor corriendo en el localhost:${PORT}`)
});

