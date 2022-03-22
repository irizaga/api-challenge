# frozen_string_literal: true

class Api::BaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  before_action :authenticate

  private

  def render_not_found_response(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def authenticate
    # ActionController::HttpAuthentication::Token::ControllerMethods
  end
end
