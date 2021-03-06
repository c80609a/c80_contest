module C80Contest

  class ButtonPhotoUploader < ::CarrierWave::Uploader::Base

    include ::CarrierWave::MiniMagick

    storage :file
    process :resize_to_limit => [965, 965]

    version :thumb do
      process :resize_to_fit => [500,500]
    end

    def store_dir
      'uploads/buttons/'
    end

    def filename
      if original_filename
        "button_#{secure_token(4)}.#{file.extension}"
      end
    end

    protected
    def secure_token(length=16)
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
    end

  end

end