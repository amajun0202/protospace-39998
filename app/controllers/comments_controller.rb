class CommentsController < ApplicationController
  def create
    new_comment = Comment.create(comment_params)
  if new_comment
    redirect_to prototype_path(new_comment.prototype.id)
  else
    render "prototypes/show", status: :unprocessable_entity
  end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
