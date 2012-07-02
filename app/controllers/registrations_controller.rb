class RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create
    build_resource

    if resource.save
      resource.account.provisioning

      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => new_user_session_path
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end


  # GET /resource/sign_up
  def new
    resource = build_resource({})
    resource.build_account
    respond_with resource
  end

end