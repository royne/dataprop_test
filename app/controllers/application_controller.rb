class ApplicationController < ActionController::Base
  before_action :set_url_options
  allow_browser versions: :modern

  def after_sign_in_path_for(resource)
    home_path
  end

  private

  def set_url_options
    ActiveStorage::Current.url_options = { host: request.base_url }
  end
end
