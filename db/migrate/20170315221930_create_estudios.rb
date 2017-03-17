class CreateEstudios < ActiveRecord::Migration
  def change
    create_table :estudios do |t|
      t.string :carrera_o_curso
      t.references :usuario, index: true, foreign_key: true
      t.belongs_to :institucion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
