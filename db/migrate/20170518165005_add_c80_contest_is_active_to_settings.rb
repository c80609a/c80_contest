class AddC80ContestIsActiveToSettings < ActiveRecord::Migration
  def change
    add_column :c80_contest_settings, :is_active, :boolean
  end
end