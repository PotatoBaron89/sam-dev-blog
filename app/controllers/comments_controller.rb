class CommentsController < ApplicationController
  before_action :no_content_unless_signed_in
  before_action :set_comment, only: %i[show update edit destroy archive]

  def show
    authorize! :read, @comment
  end

  def create
    comment = Comment.new(comment_params.merge(commenter_id: current_user.id))
    authorize! :create, comment

    if comment.save
      flash[:notice] = 'Comment successfully created'

      respond_to do |format|
        # format.turbo_stream { render turbo_stream: turbo_stream.append(comment, partial: 'comments/comments', locals: { comments: comment }) }
        format.turbo_stream { render turbo_stream: turbo_stream.prepend('comments', comment) }
        # format.turbo_stream { render turbo_stream: turbo_stream.prepend(comment), partial: 'comments/comments' }
        format.html         { redirect_to request.referrer }
      end
    else
      flash[:alert] = 'Failed to create comment'
    end
  end

  def update
    authorize! :update, @comment

    if @comment.update(comment_params)
      flash[:notice] = 'Comment successfully updated'
      redirect_to comment_path(@comment)
    else
      flash[:alert] = 'Failed to update comment'
    end
  end

  def destroy
    authorize! :destroy, @comment

    if @comment.destroy
      flash[:notice] = 'Comment successfully deleted'
    else
      flash[:alert] = 'Failed to delete comment'
    end
  end

  def edit
    authorize! :update, @comment

    render partial: 'comments/form', locals: { comment: @comment }
  end

  def archive
    authorize! :archive, @comment

    if @comment.update(archived: true)
      flash[:notice] = 'Comment successfully removed'

      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove(@comment) }
        format.html         { redirect_to request.referrer }
      end
    else
      flash[:alert] = 'Failed to removed comment'
    end
  end

  def comment_params
    params.require(:comment).permit(:commentable_id, :commentable_type, :body, :archived)
  end

  def set_comment
    @comment = Comment.eager_load(:commenter).find(params[:id])
  end
end
