class AccountController < ApplicationController
  def signup
	@user = User.new
	if request.post?
		@user = User.new(user_params)
		if @user.save
			Notifier.signup(@user).deliver
			redirect_to action: "login"
		else
			render action: "signup"
		end
	end	
  end

  def login
	if request.post?
		@user = User.authenticate(params[:user][:email],params[:user][:password])
		if @user
			session[:user]=@user.id
			redirect_to controller: "dashboard",action: "index"
		else  
			flash[:notice] = "Invalid Username / Password.please try again"
			render action: "login"
		end
	end
end

  def forget_password
		if request.post?
			@user = User.find_by_email(params[:user][:email])
			if @user
				new_password = [*(1..9),*('a'..'z')].sample(8).join			  
				@user.update(:password=>new_password)
				Notifier.forget_password(@user,new_password).deliver
				flash[:notice] = "A new password has been sent your email"
				redirect_to action: "login"
			else
				flash[:notice]="Invalid Email.Please enter correct email"
				render action: "forget_password"
			end		
		end	  
  end
  
  

  def reset_password
		@user = User.find(session[:user])		
		if request.post?			
			unless params[:user][:password].empty? or params[:user][:password]=="" or params[:user][:password_confirmation]=="" or params[:user][:password_confirmation]!=params[:user][:password]
				@user.update(user_params)
				Notifier.reset_password(@user).deliver
				flash[:notice] = "Your password has been reset"
				redirect_to controller: "dashboard",action: "index"			
			else
				flash[:notice] = "Please enter valid password"
				render action: "reset_password"				
			end
		end
  end
  
  def logout
	session[:user]=nil
	flash[:notice] = "You are logged out"
	redirect_to action: "login"  
 end

 def user_params
      params.require(:user).permit(:first_name,:last_name,:encrypted_password,:password,:email,:date_of_birth,:mobile)
 end
end
