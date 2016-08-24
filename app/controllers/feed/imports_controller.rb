require "rexml/document"

class Feed::ImportsController < ApplicationController
  before_action :authenticate_user!

  def create
    import_feed = ImportFeedService.new(import_params[:document])
    import_feed.call
    redirect_to root_path
  end

  private

  def import_params
    params.require(:import).permit(:document)
  end
end
