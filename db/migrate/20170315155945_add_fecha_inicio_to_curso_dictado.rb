class AddFechaInicioToCursoDictado < ActiveRecord::Migration
  def change
    add_column :curso_dictados, :fecha_inicio, :date
  end
end
