class Admin::BaseController < ApplicationController

  before_action :verify_admin, unless: :devise_controller?

  layout 'admin'

  private

    def verify_admin
      return redirect_to admin_path if not user_signed_in? 
      raise 'Forbidden' unless current_user.is_admin
    end
end