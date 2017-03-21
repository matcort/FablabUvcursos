class Curso < ActiveRecord::Base
    attachment :profile_image
    has_many :curso_dictados
    has_many :requisitos
    accepts_nested_attributes_for :requisitos, allow_destroy: true
    
  
end
