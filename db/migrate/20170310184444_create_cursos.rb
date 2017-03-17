class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
