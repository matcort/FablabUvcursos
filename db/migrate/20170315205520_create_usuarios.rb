class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :rut
      t.string :mail
      t.date :fechaingreso
      t.string :foto
      t.string :rol
      t.boolean :activo
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
