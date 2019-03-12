class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CurrencyApiError do |error|
    flash[:alert] = error.message
    redirect_back(fallback_location: root_path)
  end

  private

  def after_sign_in_path_for(resource)
    rates_path
  end
end
