class CommentsController < ApplicationController
  def create
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.create!(comment_params)
    redirect_to pin_path(@pin)
  end

  def edit
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
        def comment_params
            params.require(:comment).permit(:pin_id, :comment, :body, :image, :place_name)
        end
end
