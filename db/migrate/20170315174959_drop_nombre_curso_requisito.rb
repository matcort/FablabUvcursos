class DropNombreCursoRequisito < ActiveRecord::Migration
  def change
    drop_table :curso_requisitos
  end
end
