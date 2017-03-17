class DropNombreRequisito < ActiveRecord::Migration
  def change
    drop_table :requisitos
  end
end
