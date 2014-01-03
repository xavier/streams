module SignInSupportInFeatureSpecs

  include Warden::Test::Helpers

  def sign_in_as(user, password = nil)
    login_as user, scope: :user
  end

end