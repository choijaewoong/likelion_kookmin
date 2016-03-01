class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
       router_name = Devise.mappings[scope].router_name
       context = router_name ? send(router_name) : self
       context.respond_to?(:root_path) ? "/home/index" : "/home/index"
  end
end
