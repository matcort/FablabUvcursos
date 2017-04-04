class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]



def import
  #CursoDictado.import(params[:file])
  xlsx = Roo::Spreadsheet.open(params[:file])
  xlsx.sheets
 @curso = params[:curso]
 # xlsx.each_with_pagename do |name, f| #name es nombre de la hija, no
  #  p f.row(3)
#  end
  @mensaje = "hola mundo"
  xlsx.each(nombre: 'nombre', rut: 'rut', mail: "mail", fechaingreso: "fecha ingreso") do |usuario|
    
               
    @usuario = Usuario.new(usuario)
    print "hola mundo"
    print @usuario.id
    @cursodictado=CursoDictado.where(:id => @curso).first
    @guardar=true
    @bool=false
    @req=[] #requisitos faltantes
    if !@cursodictado.curso.requisitos.blank? #Si curso tiene requisito
      
      if !Usuario.where(:rut => @usuario.rut).first.blank? #Si usuario existe
        
        @cursodictado.curso.requisitos.each do |requisito| #recorrer requisitos cursos
          Usuario.where(:rut => @usuario.rut).first.curso_dictado.find_each do |usercurso| #recorrer cursos usuarios falta que este aprobado
          
            if usercurso.curso.id == requisito.nombre.to_i #nombre esta en string :S
              #puts requisito.nombre
              #puts "yy"
              #puts usercurso.curso.id
              @bool=true && @guardar
              break
            else
              @bool=false
              
            end
            
            
          end
          
          if @bool
            @guardar=true && @guardar
          else
            @guardar=false
            @req[@req.length]=requisito #terminar guardar requisitos no pasados.
            print @req
          end
          
          
        end
        
        if @guardar
            puts @idusuario
            @idusuario = Usuario.where(:rut => @usuario.rut).first.id
            CursoDictadoUsuario.create(:usuario_id =>@idusuario , :curso_dictado_id => @curso)
        else
          #render :text => 
          @mensaje= "Este curso tiene pre-requisitos y este usuario no tiene los prerequisitos." 
        end
      
        
      else
        #render :text => 
        @mensaje= "Este curso tiene pre-requisitos y este usuario no tiene cursos." 
      end
       
    else 
        if @usuario.save
            #indexar a curso_dictado_usuario
            
            CursoDictadoUsuario.create(:usuario_id => @usuario.id, :curso_dictado_id => @curso)
            @mensaje="Nuevo Usuario ingresado exitosamente"
            
        else
            #indexar a curso_dictado_usuario
            puts @idusuario
            @idusuario = Usuario.where(:rut => @usuario.rut).first.id
              CursoDictadoUsuario.create(:usuario_id =>@idusuario , :curso_dictado_id => @curso)
              @mensaje="Curso agregado a usuario antiguo."
        end
      end #fin if requisito
     
    # => { id: 1, name: 'John Smith' }
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
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
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
      params.require(:usuario).permit(:nombre, :rut, :mail, :fechaingreso, :foto, :curso, :rol, :activo, :password_digest, estudios_attributes: [:id, :carrera_o_curso, :institucion_id, :done, :_destroy, institucions_attributes: [:id, :nombre, :done, :_destroy]])
    end
end
