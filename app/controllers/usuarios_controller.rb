
require "#{Rails.root}/lib/tasks/userreq"
class UsuariosController < ApplicationController
  
    include Userreq
    
    before_action :set_usuario, only: [:show, :edit, :update, :destroy]
    add_breadcrumb "Usuarios", :usuarios_path


  def import
    
    xlsx = Roo::Spreadsheet.open(params[:file])
    xlsx.sheets
    @curso = params[:curso]
record_activity("Inserción de  Usuarios por planilla Excel")
    xlsx.each(nombre: 'nombre', rut: 'rut', mail: "mail",estudios: "estudios/curso", institucion: "institucion", fechaingreso: "fecha ingreso", asistencia: "asistencia", nota: "nota", aprobado: "aprobado") do |usuario|
      if usuario[:nombre] == "nombre" #anular primera linea del excel
        puts usuario[:id]
      else
       
        @user=Usuario.where(:rut => usuario[:rut]).first
        puts usuario
        if !@user.blank? #Si usuario existe
          if !CursoDictadoUsuario.where(:curso_dictado_id=>@curso.to_i, :usuario_id=>@user.id).first.blank? #usuario ya esta inscrito en el curso
          #########Aca sobre escribir al usuario, y no crear nuevo usuario en el curso########################################
          @cursodicuser=CursoDictadoUsuario.where(:usuario_id =>@user , :curso_dictado_id => @curso).first
            if !@cursodicuser.blank? 
              puts usuario
              @cursodicuser.update(:asistencia=>usuario[:asistencia], :nota => usuario[:nota], :aprobado=>usuario[:aprobado])
              Estudio.update(:carrera_o_curso => usuario[:estudios],:usuario_id => @user.id, :institucion_id => Institucion.where(:nombre => usuario[institucion]))
              @mensaje="update user"
            else #esta en blanco
              @mensaje="problemas linea 32"
            end
              
            
            #indexcursouser(@curso, @user)
          else #Usuario no esta inscrito en el curso
            if cursotienereq(@curso) #tiene requisito
              if comprobarreq(params[:curso], @user) #usuario tiene los cursos requisitos aprobados
                puts "marca 1"
                @mensaje=indexcursouser(@curso, @user)
              else #usuario no tiene los cursos requisitos
                
                @mensaje="Usuario no cumple con los requisitos."
              end #fin comprobante requisitos usuario
            else #no tiene requisito
              puts "marca 2"
              indexcursouser(@curso, @user)
            end
          end #fin if usuario inscrito en curso
        else # Si no existe Usuario
          if cursotienereq(@curso) #Curso Tiene requisito?
            @mensaje="El usuario no tiene cursos en FabLab."
          else  #Curso no tiene requisito
        #    @usuario=Usuario.create(:nombre => usuario[:nombre], :rut=>usuario[:rut], :mail=>usuario[:mail], :fechaingreso=>usuario[:fechaingreso])
        @usuario=Usuario.new(:nombre => usuario[:nombre], :rut=>usuario[:rut], :mail=>usuario[:mail], :fechaingreso=>usuario[:fechaingreso], password:"usersinprivilegios", password_confirmation:"usersinprivilegios")
           if @usuario.save
             @mensaje=indexcursouser(@curso, @usuario)
           else
             @mensaje ="rollback"
           end
            puts "marca 3"
          end #Fin if requisito curso.
        end #fin if usuario existe.
      end
    end
    redirect_to :back , notice: @mensaje #Alertar sobre usuario que no se pudieron ingresar y por que.
    
  end

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
    #@habilidades = Usuario.first.curso_dictado.first.curso.profile_image
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    add_breadcrumb "Ver", :usuario_path
  end

  # GET /usuarios/new
  def new
    add_breadcrumb "Nuevo", :new_usuario_path
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
    add_breadcrumb "Editando " + @usuario.nombre, :edit_usuario_path
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        record_activity("Nuevo Usuario")
        format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      record_activity("Eliminación de Usuario")
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:nombre, :rut, :mail, :fechaingreso, :foto, :curso, :rol, :activo, :password, :password_confirmation, estudios_attributes: [:id, :carrera_o_curso, :institucion_id, :done, :_destroy, institucions_attributes: [:id, :nombre, :done, :_destroy]])
    end
end
