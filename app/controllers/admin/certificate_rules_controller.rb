class Admin::CertificateRulesController < Admin::BaseController
  before_action :set_certificate_rule, only: [:show, :edit, :update, :destroy]

  # GET /certificate_rules
  # GET /certificate_rules.json
  def index
    @certificate_rules = CertificateRule.all
  end

  # GET /certificate_rules/1
  # GET /certificate_rules/1.json
  def show
  end

  # GET /certificate_rules/new
  def new
    @certificate_rule = CertificateRule.new
  end

  # GET /certificate_rules/1/edit
  def edit
  end

  # POST /certificate_rules
  # POST /certificate_rules.json
  def create
    @certificate_rule = CertificateRule.new(certificate_rule_params)

    respond_to do |format|
      if @certificate_rule.save
        format.html { redirect_to [:admin,@certificate_rule], notice: 'Certificate rule was successfully created.' }
        format.json { render :show, status: :created, location: @certificate_rule }
      else
        format.html { render :new }
        format.json { render json: @certificate_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /certificate_rules/1
  # PATCH/PUT /certificate_rules/1.json
  def update
    respond_to do |format|
      if @certificate_rule.update(certificate_rule_params)
        format.html { redirect_to @certificate_rule, notice: 'Certificate rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @certificate_rule }
      else
        format.html { render :edit }
        format.json { render json: @certificate_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /certificate_rules/1
  # DELETE /certificate_rules/1.json
  def destroy
    @certificate_rule.destroy
    respond_to do |format|
      format.html { redirect_to admin_certificate_rules_url, notice: 'Certificate rule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_certificate_rule
      @certificate_rule = CertificateRule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def certificate_rule_params
      params.require(:certificate_rule).permit(:jurisdiction_id, :certification_type_id, :new_application, :certificate_form, :renew_application, :role_id, :validity, :validity_unit)
    end
end
