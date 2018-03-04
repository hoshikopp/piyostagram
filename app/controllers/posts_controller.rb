class PostsController < ApplicationController
  before_action :set_post, only:[:show,:edit,:update,:destroy]
  before_action :authenticate, only:[:show,:new,:confirm,:edit,:update,:destroy]

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.image.retrieve_from_cache! params[:cache][:image] if params[:cache][:image].present?
    if @post.save
      PostConfirmMailer.confirm_mail(current_user).deliver
      redirect_to posts_path, notice:"投稿しました！"
    else
      @post = Post.new(post_params)
      render 'new'
    end
  end

  def confirm
    @post = Post.new(post_params)
    # binding.pry
    @post.assign_attributes(user_id: current_user.id)
    render :new if @post.invalid?
    # render :confirm
  end

  def index
    @posts = Post.all.all.order("posts.created_at desc")
    @post = @posts.page(params[:page]).per(3)
  end

  def show
    @nice = current_user.nices.find_by(post_id: @post.id)
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice:'更新しました'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_path, notice:'削除しました'
  end

  private
  def post_params
    params.require(:post).permit(:content,:image,:id, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
