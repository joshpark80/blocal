class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 16)
  end

  def show
  end

  def create
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.create!(comment_params)
    redirect_to pin_path(@pin)
  end

  def edit
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def set_comment
      @pin = Pin.find(params[:pin_id])
      @comment = Comment.find(params[:id])
    end        
    
    def comment_params
      params.require(:comment).permit(:pin_id, :comment, :body, :image, :place_name)
    end
end
