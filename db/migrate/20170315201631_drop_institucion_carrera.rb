class DropInstitucionCarrera < ActiveRecord::Migration
  def change
       drop_table :institucion_carreras
  end
end
