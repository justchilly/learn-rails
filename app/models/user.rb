class User < ActiveRecord::Base
	#this is to downcase all emails before being saved to ensure uniqueness
	before_save { self.email = email.downcase }
	
	validates_presence_of :name
	validates_length_of :name, :maximum => 50
	validates_presence_of :email
	validates_format_of :email,
		:with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
	validates_uniqueness_of :email, :case_sensitive => false	

	validates_length_of :password, :minimum => 6
	# alternate format...
	# validates :password, length: { minimum: 6 }
	has_secure_password
end
