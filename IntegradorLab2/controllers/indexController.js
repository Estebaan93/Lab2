const indexController = {
    showHomePage: (req, res) => {
        // res.render('index', { user: req.session.user });
        res.render('index2', { user: req.session.user });
    },
    showDashboard: (req, res) => {
        if (!req.session.user) {
            return res.redirect('/auth/login');
        }
        res.render('dashboard', { user: req.session.user });
    }
};

module.exports = indexController;
