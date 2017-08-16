class DashboardController < ApplicationController
  def edit_profile
		@user = User.find(session[:user])		
		if request.post?	
			if @user.update(user_params)			
				flash[:notice] = "Your profile is Updated"
				redirect_to action: "index"			
			else
				render action: "edit_profile"				
			end
		end		  

  end
  def user_params
      params.require(:user).permit(:first_name,:last_name,:date_of_birth,:mobile,:profile_image)
  end
end
