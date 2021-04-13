class BookmarksController < ApplicationController
  before_action :find_list, only: [:new, :create]

  def show; end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.create(bookmark_params)
    @bookmark.list = @list
      if @bookmark.save!
        redirect_to list_path(@list)
      else
        redirect_to new_list_bookmark_path
      end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy!
    redirect_to list_path(@bookmark.list)
  end


  private
  def find_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
