class CreateHorarioCursos < ActiveRecord::Migration
  def change
    create_table :horario_cursos do |t|
      t.string :dia
      t.time :hora
      t.references :curso_dictado, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
