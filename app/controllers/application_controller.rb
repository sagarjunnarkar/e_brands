class ApplicationController < ActionController::API  
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods  
  include ActionController::MimeResponds
  include ActionController::RequestForgeryProtection
  protect_from_forgery unless: -> { request.format.json? }
  respond_to :json

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
    end
  end

  rescue_from ActionController::ParameterMissing, with: :handle_params_exception

  rescue_from ActionController::UnpermittedParameters, with: :handle_params_exception

  private

  def handle_params_exception(exception)
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  def authenticate_user
    if request.headers['Authorization'].present?
      authenticate_or_request_with_http_token do |token|
        begin
          jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first

          @current_user_id = jwt_payload['id']
        rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
          head :unauthorized
        end
      end
    else
      head :bad_request
    end
  end
  
  def authenticate_user!(options = {})
    head :unauthorized unless signed_in?
  end

  def current_user
    @current_user ||= super || User.find_by(id: @current_user_id)
  end

  def signed_in?
    @current_user_id.present?
  end

  protected
  def authenticate_inviter!
    authenticate_user
    current_user
  end
end
