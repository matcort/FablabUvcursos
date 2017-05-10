module Userreq
  def cursotienereq(curso)
    return !CursoDictado.where(:id => curso).first.curso.requisitos.blank?
  end    
  
      def indexcursouser(curso, usuario)
          puts usuario
          puts "indexado !!!---- :S"
        @idusuario = Usuario.where(:rut => usuario.rut).first.id
        
        if CursoDictadoUsuario.create(:usuario_id =>@idusuario , :curso_dictado_id => @curso)
            return "curso indexado correctamente"
        else
            return "problema al indexar curso a usuario"
        end
      end
  
    def comprobarreq(curso, usuario)
        @bandera=true
        @cursodictado=CursoDictado.where(:id => curso).first
        @cursodictado.curso.requisitos.each do |requisitocurso| #recorrer requisitos cursos
                if CursoDictado.where(:curso_id=>requisitocurso.nombre.to_i).first.curso_dictado_usuarios.where(:usuario_id=>usuario, :aprobado=>"1").blank?
                    @bandera=false and @bandera
                else
                    @bandera=true and @bandera
                end
        end
        return @bandera
    end
    
  
end