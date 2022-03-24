# frozen_string_literal: true

class Api::BaseController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  before_action :authenticate

  private

  def render_not_found_response(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      ActiveSupport::SecurityUtils.secure_compare(token, ENV['TOKEN'])
    end
  end
end
