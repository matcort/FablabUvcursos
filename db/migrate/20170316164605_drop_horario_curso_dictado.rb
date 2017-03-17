class DropHorarioCursoDictado < ActiveRecord::Migration
  def change
    drop_table :horario_curso_dictados
  end
end
