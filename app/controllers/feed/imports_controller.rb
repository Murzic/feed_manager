require "rexml/document"

class Feed::ImportsController < ApplicationController
  before_action :authenticate_user!

  def create
    puts import_params[:document].content_type.inspect
    # REXML::Document.new(import_params[:document].tempfile).elements.each("items/item") do |element|
    #   puts element.get_elements("title").each(&:get_text)
    # end
  end

  private

  def import_params
    params.require(:import).permit(:document)
  end
end
