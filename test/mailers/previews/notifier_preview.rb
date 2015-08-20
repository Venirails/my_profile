# Preview all emails at http://localhost:3000/rails/mailers/notifier
class NotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notifier/signup
  def signup
    Notifier.signup
  end

  # Preview this email at http://localhost:3000/rails/mailers/notifier/forget_password
  def forget_password
    Notifier.forget_password
  end

  # Preview this email at http://localhost:3000/rails/mailers/notifier/reset_password
  def reset_password
    Notifier.reset_password
  end

end
