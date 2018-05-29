class ShotsController < ApplicationController
 before_action :set_shot ,only: [:show,:edit,:update,:destroy,:like,:unlike]
 before_action :authenticate_user! , only: [:edit,:update,:destroy,:like,:unlike]
 impressionist actions: [:show] ,unique: [:impressionable_type ,:impressionable_id ,:session_hash]
 
 def index
  	@shot = Shot.all.order("created_at DESC")
  end

  def show
  	
  end

  def new
  	@shot = current_user.shots.build
  end

  def create
  	@shot = current_user.shots.build(shot_params)

  	if @shot.save
  		redirect_to @shot
  	else 
  		redirect_to 'new'
  	end
  end

  def edit
  	
  end

  def update
  	
  	if @shot.update(shot_params)
  		redirect_to @shot
  	else
  		redirect_to 'edit'
  	end
  end 

  def destroy
  	@shot.destroy
  	redirect_to "index"
  end

  def like
  	@shot.liked_by current_user
  	respond_to do |format|
  		format.html { redirect_back fallback_location: root_path}
  		format.js {render layout: false}
  	end
  end

  def unlike
  	@shot.unliked_by current_user
  	respond_to do |format|
  		format.html { redirect_back fallback_location: root_path}
  		format.js {render layout: false}
  	end
  end


  private 
  def set_shot
  	@shot = Shot.find(params[:id])
  end


  def shot_params
  	params.require(:shot).permit(:title,:description,:user_shot)
  end
end
