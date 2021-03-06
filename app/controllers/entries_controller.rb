class EntriesController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @entry = current_user.entries.build(entry_params)
    if @entry.save
      flash[:success] = "Entry logged!"
      redirect_to root_url
    else
      @scale_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @entry.destroy
    redirect_to root_url
  end

  #def index
  #  @weight = Entry.entry("date(created_at) desc").page(params[:page]).per_page(10)
  #end

  private

    def entry_params
      params.require(:entry).permit(:weight)
    end

    def correct_user
      @entry = current_user.entries.find_by(id: params[:id])
      redirect_to root_url if @entry.nil?
    end
end