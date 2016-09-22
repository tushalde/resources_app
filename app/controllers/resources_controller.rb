class ResourcesController < ApplicationController
  def index
  end

  def hashmaphashtable
  	render "/resources/datastructures/hashmaphashtable"
  end

  def macshortcuts
  	render "/resources/mac/macshortcuts"
  end

  def unixcmds
  	render "/resources/unix/unixcmds"
  end
end
