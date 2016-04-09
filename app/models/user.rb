class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]



  def self.from_omniauth(access_token)
    data = access_token.info
    binding.pry
    user = User.where(:email => data.email).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      names = data.name.split(" ")
      user = User.create(
         first_name: names[0],
         last_name: names[1],
         email: data.email,
         uid: access_token.uid,
         provider: access_token.provider,
         password: Devise.friendly_token[0,20]
      )
    end
    user
  end

  # def self.from_omniauth(auth)
  #    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #      user.provider = auth.provider
  #      user.uid = auth.uid
  #      user.email = auth.info.email
  #      user.password = Devise.friendly_token[0,20]
  #    end
  # end
end
