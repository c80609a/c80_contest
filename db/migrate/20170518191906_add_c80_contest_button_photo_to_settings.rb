class AddC80ContestButtonPhotoToSettings < ActiveRecord::Migration
  def change
    add_column :c80_contest_settings, :button_photo, :string
  end
end