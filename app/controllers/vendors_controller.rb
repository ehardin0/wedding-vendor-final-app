class VendorsController < ApplicationController
  def add_use_bookmark
    b = Bookmark.new
    b.fan_id = session.fetch(:user_id)
    b.vendor_id = params.fetch("the_vendor_id")
    b.save

    redirect_to("/bookmarks", { :notice => "Bookmark created successfully." })
  end
  
  def index
    matching_vendors = Vendor.all

    @list_of_vendors = matching_vendors.order({ :created_at => :desc })

    render({ :template => "vendors/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_vendors = Vendor.where({ :id => the_id })

    @the_vendor = matching_vendors.at(0)

    render({ :template => "vendors/show.html.erb" })
  end

  def create
    the_vendor = Vendor.new
    the_vendor.name = params.fetch("query_name")
    the_vendor.category = params.fetch("query_category")
    the_vendor.description = params.fetch("query_description")
    the_vendor.website = params.fetch("query_website")
    the_vendor.geography = params.fetch("query_geography")

    if the_vendor.valid?
      the_vendor.save
      redirect_to("/vendors", { :notice => "Vendor created successfully." })
    else
      redirect_to("/vendors", { :alert => the_vendor.errors.full_messages.to_sentence })
    end
  end

  def add
    render({ :template => "vendors/add.html.erb" })
  end  

  def update
    the_id = params.fetch("path_id")
    the_vendor = Vendor.where({ :id => the_id }).at(0)

    the_vendor.name = params.fetch("query_name")
    the_vendor.category = params.fetch("query_category")
    the_vendor.description = params.fetch("query_description")
    the_vendor.website = params.fetch("query_website")
    the_vendor.geography = params.fetch("query_geography")

    if the_vendor.valid?
      the_vendor.save
      redirect_to("/vendors/#{the_vendor.id}", { :notice => "Vendor updated successfully."} )
    else
      redirect_to("/vendors/#{the_vendor.id}", { :alert => the_vendor.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_vendor = Vendor.where({ :id => the_id }).at(0)

    the_vendor.destroy

    redirect_to("/vendors", { :notice => "Vendor deleted successfully."} )
  end
end
