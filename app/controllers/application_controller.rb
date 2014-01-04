class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_event
  def after_sign_in_path_for(resource_or_scope)
  	if request.env['omniauth.origin']
  		request.env['omniauth.origin']
  	end
  	user_path(current_user)
  end


  private
  def get_event
	  if(Event.any?)
		  @crescent_event = Event.find(1)
	  else
		  @crescent_event = Event.new
		  @crescent_event.name = "Crescent City Classic"
		  @crescent_event.fund = 0.0
		  @crescent_event.date = DateTime.new(2014,4,19,13,0)
		  @crescent_event.save
	  end
  end
end
