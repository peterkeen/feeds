class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate!

  protected
  def authenticate!
    authenticate_or_request_with_http_basic do |user, pass|
      user = ENV['USERNAME'] && pass = ENV['PASSWORD']
    end
  end
  
end
