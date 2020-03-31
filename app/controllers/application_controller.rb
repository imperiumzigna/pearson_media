# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  def after_sign_in_path_for(resource)
    stored_location_for(resource) || stories_path
  end

  private
    def user_not_authorized
      sign_out_and_redirect(current_user)
    end
end
