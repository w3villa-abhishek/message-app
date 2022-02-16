 class ChatroomController < ApplicationController

	before_action :require_logged_in, only: [:create, :index]

	def home
	end


	def about
	end

	def index
		@message = Message.new
		@messages = Message.custom_display #defined in Message controller
	end


	def create
		message = current_user.messages.build(permit_params)
			if message.save
				ActionCable.server.broadcast "chatroom_channel", 
									mod_message: msg_part(message)

			else
				flash[:notice] = "Please write something before sending it...try again"
				redirect_to chatroom_path
			end

	end

private
	
	def permit_params
		params.require(:message).permit(:body)
	end

	def msg_part(msg)
		render(partial: 'messages/message', locals: {message: msg})
	end
end