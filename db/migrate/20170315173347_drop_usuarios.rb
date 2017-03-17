class DropUsuarios < ActiveRecord::Migration
  def change
    drop_table :usuarios
  end
end
