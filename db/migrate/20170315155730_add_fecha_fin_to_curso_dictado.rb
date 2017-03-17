class AddFechaFinToCursoDictado < ActiveRecord::Migration
  def change
    add_column :curso_dictados, :fecha_fin, :date
  end
end
