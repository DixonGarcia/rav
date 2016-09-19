class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :recomendations
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  def role?(r)
   role.include? r.to_s
  end

  def self.auth(params)
    user = find_by_email(params['email'].downcase)
    if user != nil then
      if user.valid_password?(params['password']) then
        user
      else
        false
      end
    else
      false
    end
  end
end
