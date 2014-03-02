class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # Callback method after suscessfull authenticatoin via Fitbit
  def fitbit
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_fitbit_oauth(request.env["omniauth.auth"],current_user)
    #raise request.env["omniauth.auth"].to_yaml
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "FitBit") if is_navigational_format?
    else
      #raise @user.to_yaml
      session["devise.user_attributes"] = @user.attributes
      redirect_to  new_user_registration_path
    end
  end
end