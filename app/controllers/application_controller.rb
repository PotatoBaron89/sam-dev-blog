class ApplicationController < ActionController::Base
  include Pagy::Backend

  def check_user_signed_in?
    redirect_to new_user_session_path unless user_signed_in?
  end

  def no_content_unless_signed_in
    head :no_content unless user_signed_in?
  end
end
