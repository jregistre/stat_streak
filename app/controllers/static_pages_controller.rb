class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @entry  = current_user.entries.build
      @scale_items = current_user.scale.paginate(:page => params[:page], :per_page => 3)
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
