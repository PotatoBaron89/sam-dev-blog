class ProfileController < ApplicationController
  before_action :check_user_signed_in?

  def profile_home
  end

  def update
    if current_user.update(user_params)
      redirect_to profile_path, notice: "Profile updated"
    else
      redirect_to profile_path, alert: "Profile not updated"
    end
  end

  def account; end

  def settings; end

  private

  def user_params
    params.require(:user).permit(User::EDITABLE_FIELDS)
  end
end
