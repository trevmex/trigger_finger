class Hackers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @hacker = Hacker.from_omniauth(request.env["omniauth.auth"])

    if @hacker.persisted?
      sign_in_and_redirect @hacker, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_hacker_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
