# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170320204329) do

  create_table "curso_dictado_usuarios", force: :cascade do |t|
    t.integer  "usuario_id"
    t.integer  "curso_dictado_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "curso_dictado_usuarios", ["curso_dictado_id"], name: "index_curso_dictado_usuarios_on_curso_dictado_id"
  add_index "curso_dictado_usuarios", ["usuario_id"], name: "index_curso_dictado_usuarios_on_usuario_id"

  create_table "curso_dictados", force: :cascade do |t|
    t.integer  "estado"
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.integer  "curso_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "curso_dictados", ["curso_id"], name: "index_curso_dictados_on_curso_id"

  create_table "cursos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "icono"
    t.string   "profile_image_id"
  end

  create_table "estudios", force: :cascade do |t|
    t.string   "carrera_o_curso"
    t.integer  "usuario_id"
    t.integer  "institucion_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "estudios", ["institucion_id"], name: "index_estudios_on_institucion_id"
  add_index "estudios", ["usuario_id"], name: "index_estudios_on_usuario_id"

  create_table "horario_cursos", force: :cascade do |t|
    t.string   "dia"
    t.time     "hora"
    t.integer  "curso_dictado_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "horario_cursos", ["curso_dictado_id"], name: "index_horario_cursos_on_curso_dictado_id"

  create_table "institucions", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requisitos", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "requisitos", ["curso_id"], name: "index_requisitos_on_curso_id"

  create_table "usuarios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "rut"
    t.string   "mail"
    t.date     "fechaingreso"
    t.string   "foto"
    t.string   "rol"
    t.boolean  "activo"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
