class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_filter :allow_cors

  #def set_access_control_headers
  #  headers['Access-Control-Allow-Origin'] = '*'
  #end

  def allow_cors
    headers['Access-Control-Request-Method'] = '*'
    headers["Access-Control-Allow-Origin"] = "*"
    headers["Access-Control-Allow-Methods"] = %w{GET POST PUT DELETE}.join(",")
    headers['Access-Control-Request-Method'] = '*'
    headers["Access-Control-Allow-Headers"] =
        %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(",")
    head(:ok) if request.request_method == "OPTIONS"
  end

  def ping
    render text: "Rails Backend 1.0"
  end
end
