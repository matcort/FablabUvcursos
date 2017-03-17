class DropUsuario < ActiveRecord::Migration
  def change
    drop_table :usuarios
  end
end
