class ApplicationController < ActionController::Base
    
    private
    def after_sign_in_path_for(resource)
      case resource
      when Admin
        admin_items_path
      when User
        root_path
      end
    end
end
