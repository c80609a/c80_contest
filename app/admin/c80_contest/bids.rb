ActiveAdmin.register C80Contest::Bid, :as => 'Bid' do

  if ActiveRecord::Base.connection.table_exists?('c80_contest_settings')
    begin
      menu :parent => C80Contest::Setting.first.admin_label_menu,
           :label => C80Contest::Setting.first.admin_label_bids if C80Contest::Setting.first.present?
    rescue NoMethodError => e # NOTE:: ошибка возникает во время миграции
      puts "[TRACE] <Admin.Bids> #{e}"
    end
  end

  config.sort_order = 'created_at_desc'

  filter :title
  filter :phone
  filter :created_at

  index do
    id_column
    column :created_at do |bid|
      l(bid.created_at.in_time_zone('Moscow'), {:format => '%Y-%b-%d [%H:%M:%S]'})
    end
    column :title
    column :phone
    column :photo do |bid|
      if bid.photo.present?
        # link_to image_tag(bid.photo.thumb.url), bid.photo.url
        thumb_base_file_name = File.basename(bid.photo.thumb.url)
        base_file_name = File.basename(bid.photo.url)
        link_to image_tag("/uploads/bids/#{thumb_base_file_name}"),
                "/uploads/bids/#{base_file_name}"
      end
    end

    actions
  end

  show do
    attributes_table do
      row :title
      row :phone
      row :created_at do |bid|
        # bid.created_at.in_time_zone('Moscow').strftime('%Y-%b-%d %H:%M:%S')
        l(bid.created_at.in_time_zone('Moscow'), {:format => '%Y-%b-%d [%H:%M:%S]'})
      end
      row :photo do |bid|
        if bid.photo.present?
          # link_to image_tag(bid.photo.thumb.url), bid.photo.url
          thumb_base_file_name = File.basename(bid.photo.thumb.url)
          base_file_name = File.basename(bid.photo.url)
          link_to image_tag("/uploads/bids/#{thumb_base_file_name}"),
                  "/uploads/bids/#{base_file_name}"
        end
      end
    end
  end

end