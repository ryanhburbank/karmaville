class UsersController < ApplicationController
  def index
    @users = User.by_karma.page(params[:page])
  end
end
