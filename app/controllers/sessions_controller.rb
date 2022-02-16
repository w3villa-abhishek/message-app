class SessionsController < ApplicationController

	before_action :require_logged_out, only: [:new, :create]

	def new
	end


	def create
		user = User.find_by(email: params[:session][:email])
		if user && (user.authenticate(params[:session][:password]))
			session[:id] = user.id
			flash[:notice] = "user logged in successfully.."
			redirect_to chatroom_path
		else
			flash.now[:notice] = "some error occured, retry or sign up..."
			render 'new'
		end
	end

	def destroy
		session[:id] = nil
		flash[:notice] = "logged out successfully"
		redirect_to root_path
	end


		


end