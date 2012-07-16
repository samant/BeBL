class ApplicationController < ActionController::Base
  protect_from_forgery
    
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  def sort_order(default_c, default_d = 'ASC')
    "#{(params[:c] || default_c.to_s).gsub(/[\s;'\"]/,'')} #{(params[:d] || default_d) == 'down' ? 'DESC' : 'ASC'}"
  end
  
end
