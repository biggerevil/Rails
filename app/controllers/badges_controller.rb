class BadgesController < ApplicationController
  def index
    @badges = Badge.all
    @user_badges = current_user.badges.all
  end
end
