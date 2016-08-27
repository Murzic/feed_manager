class Feed::ImportsController < ApplicationController
  before_action :authenticate_user!

  def create
    service_obj = FeedImport::Service.new
    service_obj.set_strategy(import_params[:document])
    service_obj.call
    redirect_to root_path
  end

  private

  def import_params
    params.require(:import).permit(:document)
  end
end
