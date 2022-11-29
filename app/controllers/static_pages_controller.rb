class StaticPagesController < ApplicationController
  def home
    @microposts = Micropost.paginate(page: params[:page]) if logged_in?
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
