class ResourcesController < ApplicationController
  before_action :logged_in_user

  def index
    @view_count = view_count_finder
  end

  def hashmaphashtable
    @view_count = view_count_finder
  	render "/resources/datastructures/hashmaphashtable"
  end

  def macshortcuts
    @view_count = view_count_finder
  	render "/resources/mac/macshortcuts"
  end

  def unixcmds
    @view_count = view_count_finder
  	render "/resources/unix/unixcmds"
  end

  def unixfilesystem
    @view_count = view_count_finder
    render "/resources/unix/unixfilesystem"
  end

  def macfilesystem
    @view_count = view_count_finder
    render "/resources/mac/macfilesystem"
  end

  def rails
    @view_count = view_count_finder
  end

  def nodejs
    @view_count = view_count_finder
  end

  private

  def view_count_finder
    if view_count = ViewCount.where(view: "#{params[:controller]}-#{params[:action]}").first
      view_count.update_attribute :count, (view_count.count + 1)
    else
      view_count = ViewCount.create(view: "#{params[:controller]}-#{params[:action]}", count: 1)
    end
    view_count.count
  end

end
