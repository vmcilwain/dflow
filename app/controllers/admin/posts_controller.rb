class Admin::PostsController < Admin::AdminController
  before_action :authorize_user, only: %i[index new create]
  before_action :post, only: %i[edit update destroy]
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to edit_admin_post_path(@post), success: success_message(@post)
    else
      flash[:error] = error_message
      render :new
    end
  end
  
  def update
    if @post.update(post_params)
      redirect_to edit_admin_post_path(@post), success: success_message(@post)
    else
      flash[:error] = error_message
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    redirect_to admin_posts_path, success: success_message(@post)
  end

  private

  def post
    @post = Post.find params[:id]
    authorize @post
  end

  def post_params
    params.require(:post).permit(:title, :content, :vidoe_url)
  end

  def authorize_user
    authorize Post
  end
end