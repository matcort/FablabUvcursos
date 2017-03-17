class Estudio < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :institucion
  
  accepts_nested_attributes_for :institucion
end
