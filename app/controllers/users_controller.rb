class UsersController < ApplicationController
  def index
  end

  def show
    @article = current_user.articles.last if user_signed_in?
    @articles = Article.where(user_id: params[:id]).order("created_at desc")
    users = User.all
    @users= users.reject{|user| user.id == current_user.id} if user_signed_in?
    @user = User.find(params[:id])
  end
end
