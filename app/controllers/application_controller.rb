class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :admin_url

  def admin_url
    "dev-bench.minami.im"
  end

end
