class ApplicationController < ActionController::Base
  # apiにおけるCSRF保護回避
  protect_from_forgery unless: -> { request.format.json? }
end
