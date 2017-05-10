class CreateC80ContestBids < ActiveRecord::Migration
  def change
    create_table :c80_contest_bids, :options => 'COLLATE=utf8_unicode_ci' do |t|
      t.string :title
      t.string :photo
      t.string :phone
      t.string :comment
      t.boolean :marked
      t.timestamps
    end
  end
end
