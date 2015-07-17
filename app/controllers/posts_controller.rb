class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all
  end

  def new
    @post = Post.new
    # authorize @post
  end

  def create
    @post = Post.new(post_params)
    # authorize @post
    if @post.save
      flash[:notice] = "Post successfully added"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    # authorize @post
  end

  def update
    @post = Post.find(params[:id])
    # authorize @post
    if @post.update(post_params)
      flash[:notice] = "Post successfully updated"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    # authorize @post
    @post.destroy
    flash[:notice] = "Post successfully deleted"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:name, :content)
  end

end
