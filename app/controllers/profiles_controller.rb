class ProfilesController < ApplicationController
  def show
  	@user = User.find_by_name(params[:id])

  	if @user 
  		
  		render action: :show
  	else
	  	render file: 'public/404', status: 404, formats: [:html]
  	end
  end

  def createdlist
  	@user = User.find_by_name(params[:id])
 
  	if @user 
  		
  		render action: :createdlist
  	else
	  	render file: 'public/404', status: 404, formats: [:html]
  	end
  end

  def collectedplaces
    @user = User.find_by_name(params[:id])

    if @user 
      
      render action: :collectedplaces

    else
      render file: 'public/404', status: 404, formats: [:html]
    end
  end

end
