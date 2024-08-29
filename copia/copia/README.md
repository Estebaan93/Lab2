NOTAS
Vistas:
Medicamento
Editar medicamento

prescripcion medica







Relaciones:
Un usuario debe ser reconocido en el sistema si es de acceso prof o adm


# docker-compose
Para levantar Mysql primero correr el docker con:
docker-compose up -d

El archivo .yml contiene las configuraciones del xampp, modificar los puertos porque mysql los tiene ocupado

Verificar que este corriendo
docker ps

Instalar MySql
sudo apt update
sudo apt install mysql-client

Conectar 
mysql -h 127.0.0.1 -P 3306 -u root -p

PUERTO 8080 agregarlo en caso de que sea para phpMyAdmin

Dentro de mysql
SHOW DATABASES; //Muestra las bases de datos
USE DATABASES;

Correr js
node app.js