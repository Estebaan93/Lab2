const User = require('../models/userModel');

const authController = {
	showLoginForm: (req, res) => {
		res.render('login');
	},

	login: (req, res) => {
		const { username, password } = req.body;
		User.findByUsername(username, (err, user) => {
			if (err) {
				console.error(err);
				return res.render('login', { error: 'Ocurrió un error, por favor intenta de nuevo.' });
			}
			if (user && User.comparePassword(password, user.password)) {
				req.session.user = user;
				res.redirect('/dashboard');
			} else {
				res.render('login', { error: 'Usuario o contraseña incorrecta.' });
			}
		});
	},

	showResgisterForm: (req, res) => {
		res.render('register');
	},

	register: (req, res) => {
		const { username, password, role } = req.body;
		User.create({ username, password, role }, (err) => {
			if (err) {
				console.error(err);
				return res.render('register', { error: 'El registro falló, por favor intenta de nuevo.' });
			}
			res.redirect('/auth/login');
		});
	},

	logout: (req, res) => {
		req.session.destroy(err => {
			if (err) {
				console.error(err);
				return res.redirect('/dashboard'); // Redirigir al dashboard o a una página de error
			}
			res.clearCookie('connect.sid'); // Limpiar la cookie
			res.redirect('/auth/login');
		});
	}
};

module.exports = authController;
