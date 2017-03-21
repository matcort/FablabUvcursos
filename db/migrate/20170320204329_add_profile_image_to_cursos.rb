class AddProfileImageToCursos < ActiveRecord::Migration
  def change
    add_column :cursos, :profile_image_id, :string
  end
end
