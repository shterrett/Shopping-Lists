class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_back_or user
		else 
			flash[:error] = "Invalid email/password combination"
			redirect_to new_session_path({ user_id: params[:session][:email] })
		end
	end

	def destroy
		sign_out current_user
		redirect_to root_path
	end
    
end
