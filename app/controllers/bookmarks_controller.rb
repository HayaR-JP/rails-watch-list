class BookmarksController < ApplicationController
    def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    @movies = Movie.order(title: :asc)
    end

  # this can't be accessed by a url. a form will post data here
  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
