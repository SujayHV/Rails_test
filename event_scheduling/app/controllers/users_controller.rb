class UsersController < ApplicationController
 	def new
 		# binding.pry
  		@user = User.new
	end

def create
  @user = User.new(user_params)
   @user.save
   	# binding.pry
    redirect_to log_in_path, :notice => "Signed up!"
 
    
 
end
	private
	def user_params
		params.require(:user).permit(:first_name,:last_name,:user_name,:email,:phone_number,:password,:password_confirmation)
	end
end
