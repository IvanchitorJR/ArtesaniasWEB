const express = require('express');
const bodyParser = require('body-parser');
const db = require('./db');
const path = require('path');

const app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));
app.post('/login', (req, res) => {
    const { usuario, contrasena } = req.body;
    const sql = 'SELECT * FROM usuarios WHERE usuario = ? AND contrasena = ?';
    db.query(sql, [usuario, contrasena], (err, result) => {
        if (err) throw err;
        if (result.length > 0) {
            res.send('Login exitoso');
        } else {
            res.send('Usuario o contraseña inválidos');
        }
    });
});


app.post('/signin', (req, res) => {
    const { usuario, contrasena } = req.body;
    // Verifica si el usuario ya existe
    const checkSql = 'SELECT * FROM usuarios WHERE usuario = ?';
    db.query(checkSql, [usuario], (err, result) => {
        if (err) return res.send('Error en la base de datos');
        if (result.length > 0) {
            return res.send('El usuario ya existe');
        }
        // Inserta el nuevo usuario
        const insertSql = 'INSERT INTO usuarios (usuario, contrasena) VALUES (?, ?)';
        db.query(insertSql, [usuario, contrasena], (err2) => {
            if (err2) return res.send('Error al crear la cuenta');
            res.send('Cuenta creada exitosamente');
        });
    });
});



app.listen(3000, () => {
    console.log('Servidor corriendo en http://localhost:3000');
    console.log('Pagina de login en http://localhost:3000/index.html');
});