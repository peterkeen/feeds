class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :authenticate!

  protected
  def authenticate!
    return unless ENV['USERNAME'].present? && ENV['PASSWORD'].present?

    authenticate_or_request_with_http_basic do |user, pass|
      user = ENV['USERNAME'] && pass = ENV['PASSWORD']
    end
  end
  
end
