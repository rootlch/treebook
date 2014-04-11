class ProfileController < ApplicationController
  before_filter :get_user

  def show
  end

  private
  def get_user
    @user = User.find_by profile_name: params[:id]
    @statuses = @user.statuses
  rescue
    render file: "public/404", format: [:html], status: 404
  end
end
