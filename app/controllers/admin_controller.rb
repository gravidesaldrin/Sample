class AdminController < ApplicationController
  before_action :require_admin
  layout "admin"

  private
  def require_admin
    unless current_user.admin?
      flash[:warning] = "You do not have Admin Rights"
      redirect_to root_path
    end
  end

   def find_user
    @user = User.find params[:id]
  end
end
