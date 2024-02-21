module SetCurrentRequestDetails
  extend ActiveSupport::Concern

  included do |base|
    if base < ActionController::Base
      set_current_tenant_through_filter if defined? ActsAsTenant
      before_action :set_request_details
    end
  end

  def set_request_details
    Current.request_id = request.uuid
    Current.user_agent = request.user_agent
    Current.ip_address = request.ip
    Current.user = current_user
  end
end
