class CursoDictadoUsuario < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :curso_dictado
end
