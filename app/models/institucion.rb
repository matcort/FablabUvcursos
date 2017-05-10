class Institucion < ActiveRecord::Base
    has_one :estudio
    validates :nombre, presence: true

end
