class CursoDictado < ActiveRecord::Base
  belongs_to :curso
  has_many :horario_cursos
  
  has_many :curso_dictado_usuarios
has_many :usuarios, through: :curso_dictado_usuarios

  accepts_nested_attributes_for :horario_cursos, allow_destroy: true





end
