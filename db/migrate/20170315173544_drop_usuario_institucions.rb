class DropUsuarioInstitucions < ActiveRecord::Migration
  def change
    drop_table :usuario_institucions
  end
end
