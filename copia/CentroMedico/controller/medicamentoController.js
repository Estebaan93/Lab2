const createConnection = require('../js/config');

// Función para guardar un medicamento
exports.guardarMedicamento = async (req, res) => {
    const { nombre_generico, nombre_comercial, id_categoria, id_familia, activo } = req.body;

    try {
        const connection = await createConnection();

        // Agregar medicamento
        const query = `
            INSERT INTO medicamento (nombre_generico, nombre_comercial, id_categoria, id_familia, activo)
            VALUES (?, ?, ?, ?, ?)
        `;
        await connection.query(query, [nombre_generico, nombre_comercial, id_categoria, id_familia, activo]);

        await connection.end();

        res.redirect('/medicamentos?mensajeExito=Medicamento agregado correctamente');
    } catch (error) {
        console.error('Error al guardar medicamento:', error);
        res.status(500).send('Error al guardar medicamento');
    }
};

// Función para mostrar el formulario de creación de medicamentos
exports.mostrarFormularioCrearMedicamento = async (req, res) => {
    try {
        const connection = await createConnection();

        // Obtener categorías y familias desde la base de datos
        const [categorias] = await connection.query('SELECT * FROM categoria');
        const [familias] = await connection.query('SELECT * FROM familia');

        await connection.end();

        // Pasar las categorías y familias a la vista
        console.log(id_categorias);
        res.render('crearMedicamento', { id_categorias, familias });
    } catch (error) {
        console.error('Error al obtener categorías o familias:', error);
        res.status(500).send('Error al cargar el formulario de medicamentos');
    }
};

// Función para obtener todos los medicamentos con detalles
exports.listarMedicamentos = async (req, res) => {
    try {
        console.log('req.user:', { usuario: req.session.usuario });
        const connection = await createConnection();

        // Consultar todos los medicamentos con detalles
        const query = `
            SELECT m.id_medicamento, m.nombre_generico, m.nombre_comercial,
                c.categoria, f.familia, m.activo
            FROM medicamento m
            INNER JOIN categoria c ON m.id_categoria = c.id_categoria
            INNER JOIN familia f ON m.id_familia = f.id_familia
        `;
        const [medicamentos] = await connection.query(query);

        await connection.end();

        res.render('medicamentos', { medicamentos, usuario: req.session.usuario });
    } catch (error) {
        console.error('Error al listar medicamentos:', error);
        res.status(500).send('Error al listar medicamentos');
    }
};

// Función para actualizar un medicamento
exports.actualizarMedicamento = async (req, res) => {
    const { id_medicamento } = req.params;
    const { nombre_generico, nombre_comercial, id_categoria, id_familia, activo } = req.body;

    try {
        const connection = await createConnection();

        // Actualizar el medicamento en la base de datos
        const query = `
            UPDATE medicamento
            SET nombre_generico = ?, nombre_comercial = ?, id_categoria = ?, id_familia = ?, activo = ?
            WHERE id_medicamento = ?
        `;
        await connection.query(query, [nombre_generico, nombre_comercial, id_categoria, id_familia, activo, id_medicamento]);

        await connection.end();

        res.redirect('/medicamentos?mensajeExito=Medicamento actualizado correctamente');
    } catch (error) {
        console.error('Error al actualizar medicamento:', error);
        res.status(500).send('Error al actualizar medicamento');
    }
};

// Función para eliminar un medicamento
exports.eliminarMedicamento = async (req, res) => {
    const { id_medicamento } = req.params;

    // Verificar el rol del usuario
    if (req.session.usuario.funcion !== 'administrador') {
        return res.status(403).send('No tienes permiso para eliminar medicamentos');
    }

    try {
        const connection = await createConnection();

        // Eliminar el medicamento de la base de datos
        const query = 'DELETE FROM medicamento WHERE id_medicamento = ?';
        await connection.query(query, [id_medicamento]);

        await connection.end();

        res.redirect('/medicamentos?mensajeExito=Medicamento eliminado correctamente');
    } catch (error) {
        console.error('Error al eliminar medicamento:', error);
        res.status(500).send('Error al eliminar medicamento');
    }
};

// Función para buscar medicamentos
exports.buscarMedicamentos = async (req, res) => {
    let connection;
    try {
        connection = await createConnection();
        const { filtro } = req.query; // Usamos req.query porque es un GET

        // Si no hay filtro, renderizar una vista vacía
        if (!filtro) {
            return res.render('buscarMedicamento', { medicamentos: [], filtro: '', mensaje: 'No se ingresó ningún filtro de búsqueda.' });
        }

        // Consulta SQL con LIKE para buscar por nombre genérico o comercial
        const consultaSQL = `
            SELECT m.id_medicamento, m.nombre_generico, m.nombre_comercial, c.categoria, f.familia, m.activo
            FROM medicamento m
            INNER JOIN categoria c ON m.id_categoria = c.id_categoria
            INNER JOIN familia f ON m.id_familia = f.id_familia
            WHERE m.nombre_generico LIKE ? OR m.nombre_comercial LIKE ?
        `;

        const [medicamentos] = await connection.query(consultaSQL, [`%${filtro}%`, `%${filtro}%`]);

        await connection.end();

        // Si no se encuentran medicamentos
        if (medicamentos.length === 0) {
            return res.render('buscarMedicamento', { medicamentos: [], filtro, mensaje: 'No se encontraron medicamentos con ese nombre.' });
        }

        // Si se encuentran medicamentos, renderizar la vista con los resultados
        res.render('buscarMedicamento', { medicamentos, filtro, mensaje: '' });
    } catch (error) {
        console.error('Error al buscar medicamentos:', error);
        res.status(500).send('Error al buscar medicamentos');
    }
};
