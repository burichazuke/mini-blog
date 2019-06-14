class ArticlesController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @article = current_user.articles.last if user_signed_in?
    @articles = Article.includes(:user).order("created_at desc")
    users = User.all
    @users= users.reject{|user| user.id == current_user.id} if user_signed_in?
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(articles_params)
    redirect_to root_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(articles_params) if article.user_id == current_user.id
    redirect_to root_path
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to root_path
  end





  private
  def articles_params
    params.require(:article).permit(:title, :text, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
