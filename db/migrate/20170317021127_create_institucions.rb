class CreateInstitucions < ActiveRecord::Migration
  def change
    create_table :institucions do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
