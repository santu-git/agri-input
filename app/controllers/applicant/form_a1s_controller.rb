class Applicant::FormA1sController < Applicant::BaseController
  before_action :set_form_a1, only: [:show, :edit, :update, :destroy]

  # GET /form_a1s
  # GET /form_a1s.json
  def index
    @form_a1s = FormA1.all
  end

  # GET /form_a1s/1
  # GET /form_a1s/1.json
  def show
  end

  # GET /form_a1s/new
  def new
    @form_a1 = FormA1.new
  end

  # GET /form_a1s/1/edit
  def edit
  end

  # POST /form_a1s
  # POST /form_a1s.json
  def create
    @form_a1 = FormA1.new(form_a1_params)

    respond_to do |format|
      if @form_a1.save
        format.html { redirect_to @form_a1, notice: 'Form a1 was successfully created.' }
        format.json { render :show, status: :created, location: @form_a1 }
      else
        format.html { render :new }
        format.json { render json: @form_a1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_a1s/1
  # PATCH/PUT /form_a1s/1.json
  def update
    respond_to do |format|
      if @form_a1.update(form_a1_params)
        format.html { redirect_to @form_a1, notice: 'Form a1 was successfully updated.' }
        format.json { render :show, status: :ok, location: @form_a1 }
      else
        format.html { render :edit }
        format.json { render json: @form_a1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_a1s/1
  # DELETE /form_a1s/1.json
  def destroy
    @form_a1.destroy
    respond_to do |format|
      format.html { redirect_to form_a1s_url, notice: 'Form a1 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_a1
      @form_a1 = FormA1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_a1_params
      params.require(:form_a1).permit(:role_id, :place_id, :place_type, :state_id, :applicant_name, :concern_name, :postal_address, :district_id, :subdivision_id, :extended_address_type, :extended_address, :certificate_type_id, :jurisdiction_id, :registration_fees, :challan_no, :challan_submission_date, :bank_name, :enclose_dd_no, :enclose_dd_date, :payment_for, :payment_drawn_on, :payment_in_favour_of, :payable_at, :terms_condition, :declaration, :applicant_user_id)
    end
end
