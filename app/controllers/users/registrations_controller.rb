class Users::RegistrationsController < Devise::RegistrationsController
  protected
  # provides path after sign up thorugh devise
  def after_sign_up_path_for(resource)
    root_path
  end
end