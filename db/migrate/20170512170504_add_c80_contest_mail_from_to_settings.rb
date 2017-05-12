class AddC80ContestMailFromToSettings < ActiveRecord::Migration
  def change
    add_column :c80_contest_settings, :mail_from, :string
    add_column :c80_contest_settings, :mail_to, :string
  end
end