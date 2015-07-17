class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
    # authorize @comment
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end


  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    # authorize @comment
    if @comment.save
      flash[:notice] = "New comment added to " + @post.name + "!"
      redirect_to post_path(@comment.post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    # authorize @comment
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    # authorize @comment
    if @comment.update(comment_params)
      flash[:notice] = @comment.author + " has been updated!"
      redirect_to post_project_path(@post, @comment)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    # authorize @comment
    @comment.destroy
    flash[:notice] = @comment.author + " has been deleted"
    redirect_to post_path(@post)
  end


private
  def comment_params
    params.require(:comment).permit(:author, :content)
  end
end
