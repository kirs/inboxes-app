class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :assign_unread_discussions
  
  private
  
  def assign_unread_discussions
    @unread_discussions_count = Discussion.unread_for(current_user).count if user_signed_in?
  end
end
