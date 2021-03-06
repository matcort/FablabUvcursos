class CursoDictadosController < ApplicationController
  
  before_action :set_curso_dictado, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Cursos Dictados", :root_path
  

  # GET /curso_dictados
  # GET /curso_dictados.json
  def index
    if current_user.rol=="1"
      @curso_dictados = CursoDictado.all
    elsif current_user.rol == "2"
      @curso_dictados =  CursoDictado.where(:id=>[CursoDictadoProfesor.where(usuario_id: current_user.id).map(&:curso_dictado_id)])
    end
  end

  # GET /curso_dictados/1
  # GET /curso_dictados/1.json
  def show
    add_breadcrumb "Ver y Agregar Estudiantes", :curso_dictado_path
    @usuarioscurso = CursoDictadoUsuario.joins(:usuario).where(:curso_dictado => params[:id])
   # CursoDictado.includes(:usuarios).where(:usuarios => { :id => params[:usuarios] } )
  end
  


  # GET /curso_dictados/new
  def new
    add_breadcrumb "Nuevo Curso Dictado", :new_curso_dictado_path
    @curso_dictado = CursoDictado.new
  end

  # GET /curso_dictados/1/edit
  def edit
   add_breadcrumb "Editar Curso Dictado", :edit_curso_dictado_path #+ Curso.where(:id=>@curso_dictado.curso_id).first.nombre, :edit_curso_dictado_path
  end

  # POST /curso_dictados
  # POST /curso_dictados.json
  def create
    @curso_dictado = CursoDictado.new(curso_dictado_params)

    respond_to do |format|
      if @curso_dictado.save
        record_activity("Nuevo Curso Dictado")
        format.html { redirect_to @curso_dictado, notice: 'Curso dictado was successfully created.' }
        format.json { render :show, status: :created, location: @curso_dictado }
      else
        format.html { render :new }
        format.json { render json: @curso_dictado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curso_dictados/1
  # PATCH/PUT /curso_dictados/1.json
  def update
    respond_to do |format|
      if @curso_dictado.update(curso_dictado_params)
        record_activity("Actualizacion de Curso Dictado")
        format.html { redirect_to @curso_dictado, notice: 'Curso dictado was successfully updated.' }
        format.json { render :show, status: :ok, location: @curso_dictado }
      else
        format.html { render :edit }
        format.json { render json: @curso_dictado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curso_dictados/1
  # DELETE /curso_dictados/1.json
  def destroy
    @curso_dictado.destroy
    respond_to do |format|
      record_activity("Eliminación de Curso Dictado")
      format.html { redirect_to curso_dictados_url, notice: 'Curso dictado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curso_dictado
      @curso_dictado = CursoDictado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curso_dictado_params
      params.require(:curso_dictado).permit(:estado, :fecha_inicio, :fecha_fin, :curso_id, horario_cursos_attributes: [:id, :dia, :hora, :done, :_destroy],  curso_dictado_profesor_attributes: [:id, :usuario_id, :curso_dictado_id, :done, :_destroy])
    end
    

end
