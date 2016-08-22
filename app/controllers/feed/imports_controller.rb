class Feed::ImportsController < ApplicationController
  def create
  end

  private

  def import_params
    params.require(:import).permit(:document)
  end
end
