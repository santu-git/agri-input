class Applicant::ApplicationsController < Applicant::BaseController
  #before_action :set_application, only: [:show, :edit, :update, :destroy]

  # GET /applications
  # GET /applications.json
  def index
    @form_a1_applications = current_applicant_user.form_a1s
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
  end

  # GET /applications/new
  def new
  end

  # GET /applications/1/edit
  def edit
  end

  # POST /applications
  # POST /applications.json
  def create
    
    @url = input_form(application_params)
    respond_to do |format|
      format.html { redirect_to @redirection_data, notice: 'Application was successfully created.' }
    end
    # respond_to do |format|
    #   if @application.save
    #     format.html { redirect_to @application, notice: 'Application was successfully created.' }
    #     format.json { render :show, status: :created, location: @application }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @application.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url, notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:jurisdiction_id,:state_id,:district_id,:subdivision_id,:certification_type_id,:application_form_type) 
    end

    def input_form(data)
      certificate_rule = CertificateRule.where(jurisdiction_id: data[:jurisdiction_id],certification_type_id: data[:certification_type_id]).first
      data[:role_id] = certificate_rule.role_id
      @form = FormMaster.find(certificate_rule.new_application) if data[:application_form_type] == 'new' 
      @form = FormMaster.find(certificate_rule.renew_application) if data[:application_form_type] == 'renew' 
      #return new_applicant_form_a1_path if @form.identifier == 'form_a1'
      @redirection_data = Hash.new
      data[:jurisdiction] = Jurisdiction.find(data[:jurisdiction_id]).name["en"]
      p "Jurisdiction Data ..............."
      p data
      #p "Data....... in input_form"
      #p data
      @redirection_data[:controller] = 'form_a1s'
      @redirection_data[:action] = 'new'
      #@redirection_data.merge(data)
      @redirection_data[:data]= data
    end
end
