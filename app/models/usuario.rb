class Usuario < ActiveRecord::Base
    
    has_many :estudios
    
    has_many :curso_dictado_usuarios
    has_many :curso_dictado, through: :curso_dictado_usuarios
    
    
    
     accepts_nested_attributes_for :estudios, allow_destroy: true
    
    validates :rut, uniqueness: true
    validates :mail, uniqueness: true
    has_secure_password
end
