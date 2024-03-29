module Vets
  class RegistrationsController < Devise::RegistrationsController
    before_filter :configure_sign_up_params, only: [:create]
    before_filter :load_states, only: [:new, :create, :edit, :update]
    before_filter :configure_account_update_params, only: [:update]

    # GET /resource/sign_up
    # def new
    #   super
    # end

    # POST /resource
    # def create
    #   super
    # end

    # GET /resource/edit
    # def edit
    #   super
    # end

    # PUT /resource
    # def update
    #   super
    # end

    # DELETE /resource
    def destroy
      logger.warn "WARNING: Attempt to destroy Vet object"
      not_found!
    end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.for(:sign_up) << extra_vet_params
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.for(:account_update) << extra_vet_params
    end

    # The path used after sign up.
    # def after_sign_up_path_for(resource)
    #   super(resource)
    # end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end

    def extra_vet_params
      [:first_name, :last_name, :address, :address_2, :city, :state, :zip, :phone, :distance_willing_to_travel]
    end

    def load_states
      @states = State.order(:name)
    end
  end
end
