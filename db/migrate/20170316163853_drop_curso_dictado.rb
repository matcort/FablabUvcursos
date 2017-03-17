class DropCursoDictado < ActiveRecord::Migration
  def change
    drop_table :curso_dictados
  end
end
