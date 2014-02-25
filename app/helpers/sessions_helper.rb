module SessionsHelper

	def sign_in(user)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.current_user = user
	end

	def signed_in?
		!current_user.nil?
	end

	# the non-space is VERY important. self.current_user = (...)
	#  is automatically converted to method current_user=(...)
	def current_user=(user)
		@current_user = user
	end

	def current_user
		remember_token = User.encrypt(cookies[:remember_token])
		# the ||= (or equals) sets the @current_user instance variable to the user
		#  corresponding to the rememeber_token, but only if @current_user is undefined
		@current_user ||= User.find_by(remember_token: remember_token)
	end

  # def current_user?(user)
  #   user == current_user
  # end

	def sign_out
		return unless signed_in?
		current_user.update_attribute(:remember_token, User.encrypt(User.new_remember_token))
		#current_user.update_attribute(:remember_token, User.new_remember_token)
		cookies.delete(:remember_token)
		self.current_user = nil
	end

end
