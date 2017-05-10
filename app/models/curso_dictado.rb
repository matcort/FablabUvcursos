class CursoDictado < ActiveRecord::Base
  belongs_to :curso
  has_many :horario_cursos, :dependent => :delete_all
  has_many :curso_dictado_profesor, :dependent => :delete_all
  
  has_many :curso_dictado_usuarios
  has_many :usuarios, through: :curso_dictado_usuarios

  accepts_nested_attributes_for :horario_cursos, allow_destroy: true
  accepts_nested_attributes_for :curso_dictado_profesor, allow_destroy: true

 validates_associated :curso_dictado_profesor, presence: true
 
 validates :curso_id, presence: true

  validates :curso_dictado_profesor, presence: true



end
