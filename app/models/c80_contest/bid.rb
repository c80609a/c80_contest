module C80Contest
  # noinspection RailsParamDefResolve
  class Bid < ActiveRecord::Base

    validates :title,
              :presence => true,
              :length => { in: 5..100 }

    validates :phone,
              :presence => true,
              :format => { with: /\A((8|\+?7)[\- ]?)?(\(?\d{3,5}\)?[\- ]?)?[\d\- ]{5,10}\z/}

    validates_presence_of :photo

    mount_uploader :photo, C80Contest::BidPhotoUploader
  end
end