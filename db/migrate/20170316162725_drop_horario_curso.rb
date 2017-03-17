class DropHorarioCurso < ActiveRecord::Migration
  def change
    drop_table :horario_cursos
  end
end
