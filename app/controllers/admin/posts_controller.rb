class Admin::PostsController < Admin::AdminController
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
    
  end

  private

  def post
    @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit(:title, :content, :vidoe_url)
  end
end