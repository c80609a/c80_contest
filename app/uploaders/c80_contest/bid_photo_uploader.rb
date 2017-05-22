module C80Contest

  class BidPhotoUploader < ::CarrierWave::Uploader::Base

    include ::CarrierWave::MiniMagick

    storage :file
    process :resize_to_limit => [1024,1024]

    version :thumb do
      process :resize_to_fit => [500,500]
    end

    def store_dir
      "#{Rails.root}/uploads/bids/"
    end

    def filename
      if original_filename
        "photo_#{secure_token(4)}.#{file.extension}"
      end
    end

    protected
    def secure_token(length=16)
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
    end

  end

end