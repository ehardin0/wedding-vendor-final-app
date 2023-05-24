class BookmarksController < ApplicationController
  before_action(:load_current_user)

  def load_current_user
    @current_user = User.where({ :id => session[:user_id] }).at(0)
  end
  
  def index
    the_id = params.fetch("user_id")

    current_user_bookmarks = Bookmark.where({ :fan_id => session[:user_id]})

    matching_bookmarks = current_user_bookmarks.all

    @list_of_bookmarks = matching_bookmarks.order({ :created_at => :desc })

    render({ :template => "bookmarks/index.html.erb" })
  end

  def show

    the_id = params.fetch("path_id")

    matching_bookmarks = Bookmark.where({ :id => the_id })

    @the_bookmark = matching_bookmarks.at(0)

    render({ :template => "bookmarks/show.html.erb" })
  end

  def create
    the_bookmark = Bookmark.new
    the_bookmark.fan_id = self.load_current_user.id
    the_bookmark.vendor_id = params.fetch("query_vendor_id")

    if the_bookmark.valid?
      the_bookmark.save
      redirect_to("/bookmarks/#{the_bookmark.id}", { :notice => "Bookmark created successfully." })
    else
      redirect_to("/bookmarks/#{the_bookmark.id}", { :alert => the_bookmark.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_bookmark = Bookmark.where({ :id => the_id }).at(0)

    the_bookmark.fan_id = params.fetch("query_fan_id")
    the_bookmark.vendor_id = params.fetch("query_vendor_id")

    if the_bookmark.valid?
      the_bookmark.save
      redirect_to("/bookmarks/#{the_bookmark.id}", { :notice => "Bookmark updated successfully."} )
    else
      redirect_to("/bookmarks/#{the_bookmark.id}", { :alert => the_bookmark.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_bookmark = Bookmark.where({ :id => the_id }).at(0)

    the_bookmark.destroy

    redirect_to("/bookmarks/#{the_bookmark.id}", { :notice => "Bookmark deleted successfully."} )
  end
end
