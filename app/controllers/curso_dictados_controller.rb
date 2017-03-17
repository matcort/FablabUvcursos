class CursoDictadosController < ApplicationController
  before_action :set_curso_dictado, only: [:show, :edit, :update, :destroy]
  

  # GET /curso_dictados
  # GET /curso_dictados.json
  def index
    @curso_dictados = CursoDictado.all
  end

  # GET /curso_dictados/1
  # GET /curso_dictados/1.json
  def show
    @usuarioscurso = CursoDictadoUsuario.joins(:usuario).where(:curso_dictado => params[:id])
   # CursoDictado.includes(:usuarios).where(:usuarios => { :id => params[:usuarios] } )
  end
  


  # GET /curso_dictados/new
  def new
    @curso_dictado = CursoDictado.new
  end

  # GET /curso_dictados/1/edit
  def edit
  end

  # POST /curso_dictados
  # POST /curso_dictados.json
  def create
    @curso_dictado = CursoDictado.new(curso_dictado_params)

    respond_to do |format|
      if @curso_dictado.save
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
      params.require(:curso_dictado).permit(:estado, :fecha_inicio, :fecha_fin, :curso_id, horario_cursos_attributes: [:id, :dia, :hora, :done, :_destroy])
    end
end
