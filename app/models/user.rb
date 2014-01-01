class User < ActiveRecord::Base

  devise :database_authenticatable,
         :rememberable,
         :trackable,
         :validatable

  def self.register!(email, password)
    create!(email: email, password: password, password_confirmation: password)
  end

end
