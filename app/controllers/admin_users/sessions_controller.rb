# require 'jsonwebtoken'
class AdminUsers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  def create
    # Find the user type
    puts "Inside signin ------------"
    params[:admin_user][:email] = params[:admin_user][:email].downcase
    user_class = :admin_user
    # Attempt authentication with Warden
    self.resource = warden.authenticate!(scope: user_class)
    auth_token = JsonWebToken.encode({ user_id: self.resource.id, user_email: self.resource.email })
    set_flash_message!(:notice, :signed_in)
    sign_in(user_class, self.resource)
    yield resource if block_given?
    respond_to_on_create auth_token
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

    def respond_to_on_create(token)
      respond_to do |format|
        format.json { render json: { token: token } }
        format.all { head :no_content }
        format.any(*navigational_formats) { redirect_to after_sign_in_path_for(resource) }
      end
    end

    def after_sign_in_path_for(resource)
      return '/admin'
    end

    def after_sign_out_path_for(resource)
      return '/admins/sign_in'
    end

    def set_flash_message(key, kind, options = {})
      message = find_message(kind, options)
      if options[:now]
        flash.now[key] = message if message.present?
      else
        flash[key] = message if message.present?
      end
    end

    # Sets flash message if is_flashing_format? equals true
    def set_flash_message!(key, kind, options = {})
      if is_flashing_format?
        set_flash_message(key, kind, options)
      end
    end

    # Get message for given
    def find_message(kind, options = {})
      options[:scope] ||= translation_scope
      options[:default] = Array(options[:default]).unshift(kind.to_sym)
      options[:resource_name] = resource_name
      options = devise_i18n_options(options)
      I18n.t("#{options[:resource_name]}.#{kind}", options)
    end

    def translation_scope
      "devise.#{controller_name}"
    end

    def devise_i18n_options(options)
      options
    end
end
