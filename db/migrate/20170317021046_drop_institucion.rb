class DropInstitucion < ActiveRecord::Migration
  def change
    drop_table :institucions
  end
end
