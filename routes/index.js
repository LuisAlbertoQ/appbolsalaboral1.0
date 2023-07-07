var express = require('express');
var router = express.Router();
/* aqui requiere la base de datos */
var dbConn = require('../lib/db');
const ejs = require('ejs');

/* GET home page. */
/* esto es para la base de datos de los cards jala los datos de las ofertas */
router.get('/', function (req, res, next) {
  dbConn.query('SELECT ol_id,date_format(ol_fecha_inicio_laborales, "%d-%m-%Y") as ol_fecha_inicio_laborales,date_format(ol_fecha_inicio_convocatoria, "%d-%m-%Y") as ol_fecha_inicio_convocatoria,date_format(ol_fecha_fin, "%d-%m-%Y") as ol_fecha_fin,ol_titulo,ol_descripcion,ol_horario,ol_salario,ol_estado,u.usu_nombre_razon_social,u.usu_usuario FROM oferta_laboral ol, empresas e , usuario u WHERE e.em_id=ol.ol_em_id AND u.usu_id=e.em_usu_id', function (err, rows) {

    if (err) {
      req.flash('error', err);
      res.render('index', { data: '' });
    } else {
      res.render('index', { data: rows });
    }
  });
});
router.get('/oferta', function (req, res, next) {
  dbConn.query('SELECT ol_id,date_format(ol_fecha_inicio_laborales, "%d-%m-%Y") as ol_fecha_inicio_laborales,date_format(ol_fecha_inicio_convocatoria, "%d-%m-%Y") as ol_fecha_inicio_convocatoria,date_format(ol_fecha_fin, "%d-%m-%Y") as ol_fecha_fin,ol_titulo,ol_descripcion,ol_horario,ol_salario,ol_estado,u.usu_nombre_razon_social,u.usu_usuario FROM oferta_laboral ol, empresas e , usuario u WHERE e.em_id=ol.ol_em_id AND u.usu_id=e.em_usu_id', function (err, rows) {

    if (err) {
      req.flash('error', err);
      res.render('ofertas', { data: '' });
    } else {
      res.render('ofertas', { data: rows });
    }
  });
});
router.get('/nosotros', function (req, res, next) {
      res.render('nosotros');
});
router.get('/login', function (req, res, next) {
  res.render('login');
});

router.post('/login', function (req, res, next) {
  email = req.body.email;
  password = req.body.password;
  console.log(email);
  dbConn.query("SELECT * FROM usuario WHERE usu_correo='" + email + "' AND usu_password='" + password + "'", function (err, rows) {

    if (err) {
      req.flash('error', err);
      console.log(err);
    } else {
      console.log(rows);
      if (rows.length) {
        nombre = rows[0]["usu_nombre_razon_social"];
        console.log(nombre);
        req.session.idu = rows[0]["usu_id"];
        req.session.user = rows[0]["usu_nombre_razon_social"];
        req.session.email = rows[0]["usu_correo"];
        req.session.admin=true;
        res.redirect("/admin");
      } else {
        res.redirect("/");
      }
    } });

  });


router.get('/admin', function (req, res, next) {
    if (req.session.admin) {
      res.render('admin/index');
    }else{
      res.redirect("/login");
    }
});

router.get('/logout',function(req,res){
    req.session.destroy();
    res.redirect("/");
});

// Añadir usuario
router.post('/usuario-add', function (req, res, next) {

  let nombre = req.body.nombre;
  let dni = req.body.dni;
  let correo = req.body.correo;
  let celular = req.body.celular;
  let direccion = req.body.direccion;
  let rol = req.body.rol;
  let usuario = req.body.usuario;
  let password = req.body.password;

  var form_data = {
    usu_nombre_razon_social: nombre,
    usu_dni_ruc: dni,
    usu_correo: correo,
    usu_celular: celular,
    usu_direccion: direccion,
    usu_rol: rol,
    usu_usuario: usuario,
    usu_password: password
  }
  dbConn.query('INSERT INTO usuario SET ?', form_data, function (err, result) {
    if (err) {
      req.flash('error', err)
    } else {
      req.flash('success', 'Usuario agregado con exito');
      
      if (rol==1) {
        res.render('part2/egresado', { form_data });
      } else if (rol==2) {
        res.render('part2/empresa', { form_data });
      } else if (rol==3) {
        res.render('part2/docente', { form_data });
      } else {
        res.render('part2/institucion', { form_data });
      }
    }
  })
})

// Añadir egresado
router.post('/egresado-add', function (req, res, next) {

  let carrera = req.body.carrera;
  let ano_egreso = req.body.ano_egreso;
  let select_genero = req.body.select_genero;
  let fecha_naci = req.body.fecha_naci;
  let select_tercio_superior = req.body.select_tercio_superior;
  let password = req.body.password;
  let correo = req.body.correo;

  dbConn.query("SELECT * FROM usuario WHERE usu_correo='" + correo + "' AND usu_password='" + password + "'", function (err, rows) {
    if (err) {
      req.flash('error', err)
    } else {
      if (rows.length) {
        id_usuario = rows[0]["usu_id"];
        var form_data = {
          eg_carrera: carrera,
          eg_anio_egreso: ano_egreso,
          eg_genero: select_genero,
          eg_fecha_nacimiento: fecha_naci,
          eg_tercio_superior: select_tercio_superior,
          eg_usu_id: id_usuario
        }
      
        dbConn.query('INSERT INTO egresado SET ?', form_data, function (err, result) {
          if (err) {
            req.flash('error', err)
          } else {
            req.flash('success', 'Egresado agregado con exito');
            dbConn.query("SELECT * FROM usuario WHERE usu_correo='" + correo + "' AND usu_password='" + password + "'", function (err, rows) {

              if (err) {
                req.flash('error', err);
                console.log(err);
              } else {
                console.log(rows);
                if (rows.length) {
                  nombre = rows[0]["usu_nombre_razon_social"];
                  console.log(nombre);
                  req.session.idu = rows[0]["usu_id"];
                  req.session.user = rows[0]["usu_nombre_razon_social"];
                  req.session.email = rows[0]["usu_correo"];
                  req.session.admin=true;
                  res.redirect("/admin");
                } else {
                  res.redirect("/");
                }
              } });
          }
        })
      }
    }
  })    
});

// Añadir docente
router.post('/docente-add', function (req, res, next) {

  let especialidad = req.body.especialidad;
  let select_genero = req.body.select_genero;
  let fecha_naci = req.body.fecha_naci;
  let select_xp = req.body.select_xp;
  let password = req.body.password;
  let correo = req.body.correo;

  dbConn.query("SELECT * FROM usuario WHERE usu_correo='" + correo + "' AND usu_password='" + password + "'", function (err, rows) {
    if (err) {
      req.flash('error', err)
    } else {
      if (rows.length) {
        id_docente = rows[0]["usu_id"];
    
        var form_data = {
          dc_especialidad: especialidad,
          dc_genero: select_genero,
          dc_fecha_nacimiento: fecha_naci,
          dc_experiencia_labolar: select_xp,
          dc_usu_id: id_docente
        }
      
        dbConn.query('INSERT INTO docente SET ?', form_data, function (err, result) {
          if (err) {
            req.flash('error', err)
          } else {
            req.flash('success', 'Docente agregado con exito');
            dbConn.query("SELECT * FROM usuario WHERE usu_correo='" + correo + "' AND usu_password='" + password + "'", function (err, rows) {

              if (err) {
                req.flash('error', err);
                console.log(err);
              } else {
                console.log(rows);
                if (rows.length) {
                  nombre = rows[0]["usu_nombre_razon_social"];
                  console.log(nombre);
                  req.session.idu = rows[0]["usu_id"];
                  req.session.user = rows[0]["usu_nombre_razon_social"];
                  req.session.email = rows[0]["usu_correo"];
                  req.session.admin=true;
                  res.redirect("/admin");
                } else {
                  res.redirect("/");
                }
              } });
          }
        })
      }
    }
  })
});

// Añadir empresa
router.post('/empresa-add', function (req, res, next) {

  let rubro = req.body.rubro;
  let fecha_create = req.body.fecha_create;
  let nro_sedes = req.body.nro_sedes;
  let tipo_gestion = req.body.tipo_gestion;
  let pagina_web = req.body.pagina_web;
  let trabajadores = req.body.trabajadores;
  let id_empresa = req.body.id_empresa;
  let password = req.body.password;
  let correo = req.body.correo;
  dbConn.query("SELECT * FROM usuario WHERE usu_correo='" + correo + "' AND usu_password='" + password + "'", function (err, rows) {
    if (err) {
      req.flash('error', err)
    } else {
      if (rows.length) {
        id_empresa = rows[0]["usu_id"];
        var form_data = {
          em_rubro: rubro,
          em_fecha_creacion: fecha_create,
          em_nro_sedes: nro_sedes,
          em_tipo_gestion: tipo_gestion,
          em_pagina_web: pagina_web,
          em_nro_trabajadores: trabajadores,
          em_usu_id: id_empresa
        }
      
        dbConn.query('INSERT INTO empresas SET ?', form_data, function (err, result) {
          if (err) {
            req.flash('error', err)
          } else {
            req.flash('success', 'Empresa agregado con exito');
            dbConn.query("SELECT * FROM usuario WHERE usu_correo='" + correo + "' AND usu_password='" + password + "'", function (err, rows) {

              if (err) {
                req.flash('error', err);
                console.log(err);
              } else {
                console.log(rows);
                if (rows.length) {
                  nombre = rows[0]["usu_nombre_razon_social"];
                  console.log(nombre);
                  req.session.idu = rows[0]["usu_id"];
                  req.session.user = rows[0]["usu_nombre_razon_social"];
                  req.session.email = rows[0]["usu_correo"];
                  req.session.admin=true;
                  res.redirect("/admin");
                } else {
                  res.redirect("/");
                }
              } });
          }
        })
      }
    }
  })
});

// Añadir institucion
router.post('/institucion-add', function (req, res, next) {

  let carreras = req.body.carreras;
  let becados = req.body.becados;
  let fecha_create = req.body.fecha_create;
  let id_institucion = req.body.id_institucion;
  let password = req.body.password;
  let correo = req.body.correo;
  dbConn.query("SELECT * FROM usuario WHERE usu_correo='" + correo + "' AND usu_password='" + password + "'", function (err, rows) {
    if (err) {
      req.flash('error', err)
    } else {
      if (rows.length) {
        id_institucion = rows[0]["usu_id"];
        var form_data = {
          ins_nro_carrera: carreras,
          ins_nro_becados: becados,
          ins_fecha_creacion: fecha_create,
          ins_usu_id: id_institucion
        }
      
        dbConn.query('INSERT INTO institucion SET ?', form_data, function (err, result) {
          if (err) {
            req.flash('error', err)
          } else {
            req.flash('success', 'Instituto agregado con exito');
            dbConn.query("SELECT * FROM usuario WHERE usu_correo='" + correo + "' AND usu_password='" + password + "'", function (err, rows) {

              if (err) {
                req.flash('error', err);
                console.log(err);
              } else {
                console.log(rows);
                if (rows.length) {
                  nombre = rows[0]["usu_nombre_razon_social"];
                  console.log(nombre);
                  req.session.idu = rows[0]["usu_id"];
                  req.session.user = rows[0]["usu_nombre_razon_social"];
                  req.session.email = rows[0]["usu_correo"];
                  req.session.admin=true;
                  res.redirect("/admin");
                } else {
                  res.redirect("/");
                }
              } });
          }
        })
      }
    }
  })
});
  module.exports = router;