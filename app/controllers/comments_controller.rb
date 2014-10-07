class CommentsController < ApplicationController
  before_action :set_comment, only: [:show]
  before_action :set_collect, only: [:edit, :update, :collect, :destroy]

  def index
    @comments = Comment.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 25)
  end

  def show
  end

  def new
  end

  def create
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.create!(comment_params)
    redirect_to pin_path(@pin)
  end

  def edit

  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to [@comment.pin, @comment], notice: 'Place was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  def collect
    type = params[:type]
    if type == "collect"
      current_user.collects << @comment
      redirect_to :back, notice: 'Collect.'

    elsif type == "uncollect"
      current_user.collects.delete(@comment)
      redirect_to :back, notice: 'Uncollect.'

    else
      redirect_to :back, notice: 'Nothing happened'
    end  
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def set_comment
      @pin = Pin.find(params[:pin_id])
      @comment = Comment.find(params[:id])
    end        

    def set_collect
      @comment = Comment.find(params[:id])
    end  
    
    def comment_params
      params.require(:comment).permit(:pin_id, :comment, :body, :image, :photo, :photo2, :photo3, :photo4, :place_name, :neighborhood, :country, :city, :keyword, :address, :phone, :keyword, :additional)
    end
end
