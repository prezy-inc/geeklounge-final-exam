class LikesController < ApplicationController

  def create
    @micropost = Micropost.find(params[:micropost_id])
    like = current_user.likes.build(micropost_id: @micropost.id)
    like.save
    respond_to do |format|
      format.html { redirect_to @micropost, status: :see_other }
      format.turbo_stream
    end
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    like = current_user.likes.find_by(micropost_id: @micropost.id)
    like.destroy
    respond_to do |format|
      format.html { redirect_to @micropost, status: :see_other }
      format.turbo_stream
    end
  end
end
