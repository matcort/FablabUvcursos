# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

CursoDictadoUsuario.delete_all
Usuario.create(nombre:"Mati", rut:1)
CursoDictadoUsuario.create(usuario_id:395, curso_dictado_id:9, aprobado:"1")