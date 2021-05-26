class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
     private
    def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(Admin)
        admin_orders_path
      else
        customers_path
      end
    end

    def after_sign_out_path_for(resource_or_scope)
      if  resource_or_scope == :admin
        new_admin_session_path
      else
        root_path
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[:email, :last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :address, :phone_number])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
    end
end
