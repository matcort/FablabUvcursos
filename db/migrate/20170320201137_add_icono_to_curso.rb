class AddIconoToCurso < ActiveRecord::Migration
  def change
    add_column :cursos, :icono, :string
  end
end
