class SessionsController < ApplicationController
	def new
end

def create
  user = User.authenticate(params[:user_name], params[:password])
  if user
    session[:user_id] = user.id
  # binding.pry
    redirect_to user_events_path(user)
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end

# def destroy
#   session[:user_id] = nil
#   redirect_to root_url, :notice => "Logged out!"
# end
end
