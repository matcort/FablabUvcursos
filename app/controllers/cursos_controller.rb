class CursosController < ApplicationController
  before_action :set_curso, only: [:show, :edit, :update, :destroy]
add_breadcrumb "Cursos", :cursos_path
  # GET /cursos
  # GET /cursos.json
  def index
    @cursos = Curso.all
  end

  # GET /cursos/1
  # GET /cursos/1.json
  def show
    add_breadcrumb "Ver", :curso_path
  end

  # GET /cursos/new
  def new
    add_breadcrumb "Nuevo", :new_curso_path
    @curso = Curso.new
  end

  # GET /cursos/1/edit
  def edit
    add_breadcrumb "Editar", :edit_curso_path
  end

  # POST /cursos
  # POST /cursos.json
  def create
    @curso = Curso.new(curso_params)
    
    respond_to do |format|
      @curso
      if @curso.save
        record_activity("Nuevo Curso")
        format.html { redirect_to @curso, notice: 'Curso was successfully created.' }
        format.json { render :show, status: :created, location: @curso }
      else
        format.html { render :new }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end
  
  

  # PATCH/PUT /cursos/1
  # PATCH/PUT /cursos/1.json
  def update
    respond_to do |format|
      if @curso.update(curso_params)
        record_activity("Actualización de Curso ")
        format.html { redirect_to @curso, notice: 'Curso was successfully updated.' }
        format.json { render :show, status: :ok, location: @curso }
      else
        format.html { render :edit }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cursos/1
  # DELETE /cursos/1.json
  def destroy
    @curso.destroy
    respond_to do |format|
      record_activity("Eliminación de Curso ")
      format.html { redirect_to cursos_url, notice: 'Curso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curso
      @curso = Curso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curso_params
      params.require(:curso).permit(:nombre, :icono, :profile_image, requisitos_attributes: [:id, :nombre, :done, :_destroy])
    end
end
