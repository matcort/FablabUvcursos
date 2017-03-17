class DropCarrera < ActiveRecord::Migration
  def change
    drop_table :carreras
  end
end
