class UsersController < ApplicationController

	before_action :require_logged_out, only: [:new, :create]

	def new
		@user = User.new
	end


	def create
		@user = User.new(params_require)
		if @user.save
			flash[:notice] = "User created successfully"
			redirect_to root_path
		else
			flash.now[:notice] = "user cannot be created"
			render new_user_path
		end

	end

private
	
	def params_require
		params.require(:user).permit(:user_name, :email, :password)
	end



end

