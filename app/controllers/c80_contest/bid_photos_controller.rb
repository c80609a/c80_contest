module C80Contest
  class BidPhotosController < ApplicationController
    before_filter :authenticate_user!
    skip_before_filter :verify_authenticity_token
    def image
      path = "uploads/bids/#{params[:file_name]}.#{params[:ext]}"
      send_file path, :x_sendfile => true, :disposition => :inline
    end
  end
end