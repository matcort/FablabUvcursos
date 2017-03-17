class CreateCursoDictados < ActiveRecord::Migration
  def change
    create_table :curso_dictados do |t|
      t.integer :estado
      t.date :fecha_inicio
      t.date :fecha_fin
      t.references :curso, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
