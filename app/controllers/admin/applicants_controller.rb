class Admin::ApplicantsController < Admin::BaseController
  before_action :set_applicant, only: [:show, :edit, :update, :destroy]

  # GET /applicants
  # GET /applicants.json
  def index
    #@applicants = ApplicantUser.all.page(page: params[:page] || 1, per_page: 20)
    @applicants = ApplicantUser.all
  end

  # GET /applicants/1
  # GET /applicants/1.json
  def show
  end

  # GET /applicants/new
  def new
    @applicant = ApplicantUser.new
  end

  # GET /applicants/1/edit
  def edit
  end

  # POST /applicants
  # POST /applicants.json
  def create
    @applicant = ApplicantUser.new(applicant_params)

    respond_to do |format|
      if @applicant.save
        format.html { redirect_to admin_applicant_path(@applicant), notice: 'Applicant was successfully created.' }
        format.json { render :show, status: :created, location: @applicant }
      else
        format.html { render :new }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applicants/1
  # PATCH/PUT /applicants/1.json
  def update
    respond_to do |format|
      if @applicant.update(applicant_params)
        format.html { redirect_to admin_applicant_path(@applicant), notice: 'Applicant was successfully updated.' }
        format.json { render :show, status: :ok, location: @applicant }
      else
        format.html { render :edit }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicants/1
  # DELETE /applicants/1.json
  def destroy
    @applicant.destroy
    respond_to do |format|
      format.html { redirect_to applicants_url, notice: 'Applicant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant
      @applicant = ApplicantUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def applicant_params
      params.fetch(:applicant, {})
    end
end
