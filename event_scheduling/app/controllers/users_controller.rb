class UsersController < ApplicationController
 	def new
 		# binding.pry
  		@user = User.new
	end

def create
  @user = User.new(user_params)
  if @user.save
    redirect_to log_in_path, :notice => "Signed up!"
  else
    render "new"
  end
end
	private
	def user_params
		params.require(:user).permit(:first_name,:last_name,:user_name,:email,:phone_number,:password,:password_confirmation)
	end
end
