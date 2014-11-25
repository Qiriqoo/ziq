class Admin::BaseController < ApplicationController

  before_action :verify_admin, unless: :devise_controller?

  layout 'admin'

  private

    def verify_admin
      return redirect_admin_path("Connectez-vous afin d'entrer dans l'administration") unless user_signed_in?
      return redirect_admin_path("Vous n'avez pas accés à cette partie du site") unless current_user.is_admin
    end

    def redirect_admin_path notice
      redirect_to admin_path, notice: notice
    end
end