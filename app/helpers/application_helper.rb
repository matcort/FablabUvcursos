module ApplicationHelper

    def habilidad(path)
        File.open("app/assets/images/habilidades/#{path}", "rb") do |file|
        raw file.read 
        end    
    end
    

end
