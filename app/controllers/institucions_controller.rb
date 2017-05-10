class InstitucionsController < ApplicationController
  before_action :set_institucion, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Instituciones", :institucions_path

  # GET /institucions
  # GET /institucions.json
  def index
    @institucions = Institucion.all
  end

  # GET /institucions/1
  # GET /institucions/1.json
  def show
    add_breadcrumb "Ver Institucion", :institucion_path
  end

  # GET /institucions/new
  def new
    add_breadcrumb "Nueva Institución", :new_institucion_path
    @institucion = Institucion.new
  end

  # GET /institucions/1/edit
  def edit
        add_breadcrumb "Editar Institucion", :edit_institucion_path

  end

  # POST /institucions
  # POST /institucions.json
  def create
    @institucion = Institucion.new(institucion_params)

    respond_to do |format|
      if @institucion.save
        format.html { redirect_to @institucion, notice: 'Institucion was successfully created.' }
        format.json { render :show, status: :created, location: @institucion }
      else
        format.html { render :new }
        format.json { render json: @institucion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /institucions/1
  # PATCH/PUT /institucions/1.json
  def update
    respond_to do |format|
      if @institucion.update(institucion_params)
        format.html { redirect_to @institucion, notice: 'Institucion was successfully updated.' }
        format.json { render :show, status: :ok, location: @institucion }
      else
        format.html { render :edit }
        format.json { render json: @institucion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /institucions/1
  # DELETE /institucions/1.json
  def destroy
    @institucion.destroy
    respond_to do |format|
      format.html { redirect_to institucions_url, notice: 'Institucion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_institucion
      @institucion = Institucion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def institucion_params
      params.require(:institucion).permit(:nombre)
    end
end
