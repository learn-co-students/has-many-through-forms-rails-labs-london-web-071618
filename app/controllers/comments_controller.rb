class CommentsController < ApplicationController

  def create
    if params["comment"]["user"].empty?
      comment = Comment.create(comment_params)
    else
      comment = Comment.create(comment_params2)
      comment.user = User.create(username: params["comment"]["user"])
      comment.save
    end
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

  def comment_params2
    params.require(:comment).permit(:content, :post_id)
  end
end


# {"utf8"=>"✓", "authenticity_token"=>"SRglWqca+k5hy14Zr2R9tvbysijVEKMYJxIAgOLjjR4TeH1s2x7sQ+UX3SoZObjmd7FvB76yxamMgbpsV7q9kg==", "comment"=>{"content"=>"Testing 3 content", "user_id"=>"1", "user"=>"Adam", "post_id"=>"1"}, "commit"=>"Create Comment", "controller"=>"comments", "action"=>"create"}
