class UsersController < ApplicationController
  def index
    @users = User.by_karma.page(params[:page])
    @count = User.count
    @page_num = params["page"].to_i
    @page_num = 1 if @page_num == 0
  end
end
