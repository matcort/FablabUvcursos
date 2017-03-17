class DropEstudio < ActiveRecord::Migration
  def change
    drop_table :estudios
  end
end
