class Notifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.signup.subject
  #
  def signup(user)
  	@user = user
  	mail(:to => (user.email), :subject => "Welcome to MyProfile")

  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.forget_password.subject
  #
  def forget_password(user,password)
  	@user = user
  	@password = password
  	mail(:to => (user.email), :subject => "Your Temproary password...")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.reset_password.subject
  #
  def reset_password(user)
    @user = user
    
    mail(:to => (user.email), :subject => "Your password has been reset...")
  end
end
