class CreateCursoDictadoProfesors < ActiveRecord::Migration
  def change
    create_table :curso_dictado_profesors do |t|
        t.references :usuario, index: true, foreign_key: true
        t.references :curso_dictado, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
