const express = require('express');
const bodyParser = require('body-parser');
const db = require('./db');
const path = require('path');

const app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));
app.post('/login', (req, res) => {
    const { correo, contrasena } = req.body;
    const sql = 'SELECT * FROM usuarios WHERE correo = ? AND Contrasena = ?';
    db.query(sql, [correo, contrasena], (err, result) => {
        if (err) throw err;
        if (result.length > 0) {
            res.send('Login exitoso');
        } else {
            res.send('Usuario o contraseña inválidos');
        }
    });
});


app.post('/signin', (req, res) => {
    // Extraemos todos los campos enviados por el formulario
    const { Nombre, correo, Contrasena, Numero, Rol } = req.body;
    
    // Verifica si el usuario ya existe (usando el correo)
    const checkSql = 'SELECT * FROM usuarios WHERE correo = ?';
    db.query(checkSql, [correo], (err, result) => {
        if (err) return res.send('Error en la base de datos');
        if (result.length > 0) {
            return res.send('El usuario ya existe');
        }
        // Inserta el nuevo usuario con todos los datos
        const insertSql = 'INSERT INTO usuarios (Nombre, correo, Contrasena, Numero, Rol) VALUES (?, ?, ?, ?, ?)';
        db.query(insertSql, [Nombre, correo, Contrasena, Numero, Rol], (err2) => {
            if (err2) return res.send('Error al crear la cuenta');
            res.send('Cuenta creada exitosamente');
        });
    });
});



app.listen(4000, () => {
    console.log('Servidor corriendo en http://localhost:4000');
    console.log('Pagina de login en http://localhost:4000/login.html');
});