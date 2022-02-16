class ApplicationController < ActionController::Base

	helper_method [:current_user, :logged_in?]


	def current_user
		@current_user ||= User.find(session[:id]) if session[:id]
	end


	def logged_in?
		!!current_user
	end


	def require_logged_in
		if !logged_in?
			flash[:notice] = "please log in first..."
			redirect_to login_path
		end
	end

	def require_logged_out
			if current_user != nil
				flash[:notice] = "log out first to login from another account"
				redirect_to chatroom_path
			end
		end
end
