class ApplicationController < ActionController::Base
  include Pundit::Authorization

  def pundit_user
    current_therapist
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def pundit_user
    current_therapist
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
end
