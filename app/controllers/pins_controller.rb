class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy, :favorite]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 16) 
    @comments = Comment.all
  end

  def show
    @pin = Pin.find(params[:id])
    @comments = @pin.comments.order("created_at DESC").paginate(:page => params[:page], :per_page => 18)
  end

  def new
    @pin = current_user.pins.build
  end

  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pin }
      else
        format.html { render action: 'new' }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url }
      format.json { head :no_content }
    end
  end

  def favorite
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @pin
      redirect_to :back, notice: 'You are now following this list.'

    elsif type == "unfavorite"
      current_user.favorites.delete(@pin)
      redirect_to :back, notice: 'You are not following this list anymore.'

    else
      redirect_to :back, notice: 'Nothing happened'
    end  
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
    end

    def pin_params
      params.require(:pin).permit(:description, :image, :title)
    end
end
