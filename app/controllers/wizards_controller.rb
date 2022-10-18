class WizardsController < ApplicationController
  before_action :set_wizard, only: %i[ show edit update destroy ]

  # GET /wizards or /wizards.json
  def index
    @wizards = Wizard.all
  end

  # GET /wizards/1 or /wizards/1.json
  def show
  end

  # GET /wizards/new
  def new
    @wizard = Wizard.new
  end

  # GET /wizards/1/edit
  def edit
  end

  # POST /wizards or /wizards.json
  def create
    @wizard = Wizard.new(wizard_params)

    respond_to do |format|
      if @wizard.save
        format.html { redirect_to @wizard, notice: "Wizard was successfully created." }
        format.json { render :show, status: :created, location: @wizard }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wizard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wizards/1 or /wizards/1.json
  def update
    respond_to do |format|
      if @wizard.update(wizard_params)
        format.html { redirect_to @wizard, notice: "Wizard was successfully updated." }
        format.json { render :show, status: :ok, location: @wizard }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wizard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wizards/1 or /wizards/1.json
  def destroy
    @wizard.destroy
    respond_to do |format|
      format.html { redirect_to wizards_url, notice: "Wizard was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wizard
      @wizard = Wizard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wizard_params
      params.require(:wizard).permit(:name)
    end
end
