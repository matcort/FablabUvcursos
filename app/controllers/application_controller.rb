class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper
    before_action :logged_in_user, only: [:index]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    private
    
        def logged_in_user
            unless logged_in?
                flash[:danger] = "Please log in."
                redirect_to login_url
            end
        end
        
def record_activity(note)
    @activity = Activity.new
    @activity.user_id = current_user.nombre
    @activity.note = note
    @activity.browser = request.env['HTTP_USER_AGENT']
    @activity.ip_address = request.env['REMOTE_ADDR']
    @activity.controller = controller_name 
    @activity.action = action_name 
    @activity.params = params.inspect
    @activity.save
end

end
