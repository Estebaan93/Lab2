const User= requiere('../models/userModel');

const authController= {
	showLoginForm: (req, res)=>{
		res.render('login');		
	},
	login: (req, res)=>{
		const {username, password}= req.body;
		User.findByUsername(username, (err, user)=>{
			if(err) throw err;
			i(user && User.comparePassword(password, user.password)){
				req.session.user=user;
				res.redirect('/dashboard');
			}else{
				res.render('login', {error: 'Usuario o contraseña incorrecta'});
			}
		});
	},
	showRegisterForm: (req, res)=>{
		res.render('register');
	},
	register: (req, res)=>{
		const {username, password, role}= req.body;
		User.create {username, password, role, (err)=>{
			if(err) throw err;
			res.redirect('/auth/login');
		}};
	},
	logout: (req, res)=>{
		req.session.destroy();
		res.redirect('/auth/login');
	}

};

module.exports= authController;