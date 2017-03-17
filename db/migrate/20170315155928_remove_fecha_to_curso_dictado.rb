class RemoveFechaToCursoDictado < ActiveRecord::Migration
  def change
    remove_column :curso_dictados, :fecha, :date
  end
end
