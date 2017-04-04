class AddAprobacionToCursoDictadoUsuario < ActiveRecord::Migration
  def change
    add_column :curso_dictado_usuarios, :aprobado, :string
    add_column :curso_dictado_usuarios, :asistencia, :float
    add_column :curso_dictado_usuarios, :nota, :float
  end
end
