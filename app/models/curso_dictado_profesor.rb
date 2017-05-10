class CursoDictadoProfesor < ActiveRecord::Base
     belongs_to :usuario
     belongs_to :curso_dictado
     validates :usuario_id, presence: true
end
