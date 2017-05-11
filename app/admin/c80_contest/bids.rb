ActiveAdmin.register C80Contest::Bid, :as => 'Bid' do

  if ActiveRecord::Base.connection.table_exists?('c80_contest_settings')
    menu :parent => C80Contest::Setting.first.admin_label_menu,
         :label => C80Contest::Setting.first.admin_label_menu if C80Contest::Setting.first.present?
  end

  config.sort_order = 'created_at_desc'

  filter :title
  filter :phone
  filter :created_at

  index do
    id_column
    column :created_at
    column :title
    column :phone
    column :photo do |bid|
      if bid.photo.present?
        link_to image_tag(bid.photo.thumb.url), bid.photo.url
      end
    end

    actions
  end

end