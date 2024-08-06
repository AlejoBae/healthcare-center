class AdminUsersController < ApplicationController
  before_action :authenticate_admin_user!

  def index
    @admin = current_admin_user.id
  end

  def show; end
end
