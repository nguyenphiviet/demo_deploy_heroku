class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    generic_callback "google_oauth2"
  end

  def facebook
    generic_callback "facebook"
  end

  def twitter
    generic_callback "google_oauth2"
  end

  def generic_callback provider
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: "#{provider}"
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except(:extra)
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end
end
