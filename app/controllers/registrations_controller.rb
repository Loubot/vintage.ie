class RegistrationsController < Devise::RegistrationsController
	def update
    @merchant = Merchant.find(current_merchant.id)

    successfully_updated = if needs_password?(@merchant, params)
      @merchant.update_with_password(devise_parameter_sanitizer.sanitize(:account_update))
    else
      # remove the virtual current_password attribute
      # update_without_password doesn't know how to ignore it
      params[:merchant].delete(:current_password)
      params[:merchant].delete(:email)
      params[:mearchant].delete(:email_confirmation)
      @merchant.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the merchant bypassing validation in case their password changed
      sign_in @merchant, :bypass => true
      redirect_to after_update_path_for(@merchant)
    else
      render "edit"
    end
  end

  private

  # check if we need password to update merchant data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(merchant, params)
    merchant.email != params[:merchant][:email] ||
      params[:merchant][:password].present?
  end

  protected

    def after_update_path_for(resource)
      merchants_shops_path(resource)
    end
end
