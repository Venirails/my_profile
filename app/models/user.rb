class User < ActiveRecord::Base
   attr_accessor :password
   has_attached_file :profile_image, :default_url => "missing.png"
   validates :first_name,:last_name,:date_of_birth,presence: true
   validates :email, uniqueness:  true, length: { in: 5..50 }
   validates :password ,presence: true,confirmation: true, length: {  in: 4..20}, on: create
   validates :mobile ,presence: true, length: {  is: 10}
   before_save :encrypt_password


  def self.authenticate(email,password)
    user = find_by_email(email)
    return user if user && user.authenticated_password(password)

  end 

  def authenticated_password(password)
    self.encrypted_password == encrypt(password)
  end

  protected 
  def encrypt_password 
  	return if password.blank?
  	self.encrypted_password = encrypt(password)
  end

  def encrypt(string) 
 	Digest::SHA1.hexdigest(string) 
  end

end
