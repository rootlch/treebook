class ProfileController < ApplicationController
  before_filter :get_user

  def show
  end

  private
  def get_user
    @user = User.find(params[:id])
    @statuses = @user.statuses
  rescue
    render file: "public/404", format: [:html], status: 404
  end
end
