class Hacker < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |hacker|
      hacker.email = auth.info.email
      hacker.password = Devise.friendly_token[0,20]
      hacker.name = auth.info.name
      hacker.image = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |hacker|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        hacker.email = data["email"] if hacker.email.blank?
      end
    end
  end
end
