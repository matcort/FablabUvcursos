# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#CursoDictadoUsuario.delete_all
#Usuario.create(nombre:"Mati", rut:1)
#CursoDictadoUsuario.create(usuario_id:395, curso_dictado_id:9, aprobado:"1")
#CursoDictado.delete_all
#Estudio.delete_all
#HorarioCurso.delete_all
#Usuario.delete_all
#Curso.delete_all

#Curso.create(nombre:"Curso A")
#Curso.create(nombre:"Curso B")
#Curso.create(nombre:"Curso C")

Usuario.create(nombre:"Admin", rut:1, password:"12345678", password_confirmation:"12345678", rol:"1", mail:"a")
Usuario.create(nombre:"M1", rut:21, password:"12345678", password_confirmation:"12345678", rol:"1", mail:"da")
Usuario.create(nombre:"a", rut:31, password:"12345678", password_confirmation:"12345678", rol:"1", mail:"sda")
Usuario.create(nombre:"b", rut:41, password:"12345678", password_confirmation:"12345678", rol:"1", mail:"asd")
Usuario.create(nombre:"c", rut:51, password:"12345678", password_confirmation:"12345678", rol:"1", mail:"dsea")
Usuario.create(nombre:"d", rut:16, password:"12345678", password_confirmation:"12345678", rol:"1", mail:"ega")

