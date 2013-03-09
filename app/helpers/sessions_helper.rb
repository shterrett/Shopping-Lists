module SessionsHelper
  
  def sign_in(user)
  		session[:user_id] = user.id
  		self.current_user = user
  	end

  	def signed_in?
  		!current_user.nil?
  	end

  	def current_user=(user)
  		@current_user = user
  	end
 
   	def current_user
   		if session[:user_id]
  			@current_user ||= User.find_by_id(session[:user_id])
  		else
  			nil
  		end
  	end

  	def sign_out(user)
  		session[:user_id] = nil
  		session[:return_to] = nil
  		self.current_user = nil
  	end

  	def signed_in_user
  		store_location
    	redirect_to signin_path, notice: "Please sign in." unless signed_in?
  	end

  	def redirect_back_or(default)
      redirect_to(session[:return_to] || default)
      session.delete(:return_to)
    end

    def store_location
      session[:return_to] = request.fullpath
    end  
  
end
