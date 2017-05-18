class AddC80ContestAdminLabelsToSettings < ActiveRecord::Migration
  def change
    add_column :c80_contest_settings, :admin_label_settings, :string
    add_column :c80_contest_settings, :admin_label_bids, :string
  end
end