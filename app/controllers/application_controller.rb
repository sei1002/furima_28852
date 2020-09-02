class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :kana_first, :kana_last, :birthday, :nickname, ])
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |id, password|
      id == ENV['BASIC_AUTH_ID'] && password == ENV['BASIC_AUTH_PASSWORD']  # 環境変数を読み込む記述に変更
    end
  end
end
