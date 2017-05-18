if defined?(ActiveAdmin)
  ActiveAdmin.register C80Contest::Setting do

    if ActiveRecord::Base.connection.table_exists?('c80_contest_settings')
      menu :parent => C80Contest::Setting.first.admin_label_menu,
           :label => C80Contest::Setting.first.admin_label_settings if C80Contest::Setting.first.present?
    end

    before_filter :skip_sidebar!, :only => :index

    controller do

      def update
        setting = C80Contest::Setting.find(params[:id])
        permitted_params[:setting].each_key do |k|
          setting.update_column(k, permitted_params[:setting][k])
        end
        render :action => 'index'
      end

      def permitted_params
        params.permit(
            :utf8, :_method, :authenticity_token, :commit, :id,
            :setting => [
                :form_title,
                :form_label_name,
                :form_label_phone,
                :form_label_photo,
                :form_label_button_send,
                :form_label_button_sending,
                :rules,
                :ok_text,
                :ok_text_title,
                :message_letter_subj,
                :message_text,
                :admin_label_menu,
                :admin_label_settings,
                :admin_label_bids,
                :mail_from,
                :mail_to
            ]
        )
      end
    end

    index do
      column do |s|
        a = ''
        s.attribute_names.sort.each do |n|
          next if n =~ /message_text|created_at|updated_at|id/
          a += "<li><em>#{n}:</em>#{s[n]}</li>"
        end
        "<ul>#{a}</ul>".html_safe
      end

      actions
    end

    form(:html => {:multipart => true}) do |f|
      f.inputs do
        f.input :form_title
        f.input :form_label_name
        f.input :form_label_phone
        f.input :form_label_photo
        f.input :form_label_button_send
        f.input :form_label_button_sending
        f.input :rules, :input_html => {:rows => 3, :class => 'code_area'}
        f.input :ok_text
        f.input :ok_text_title
        f.input :mail_from
        f.input :mail_to
        f.input :message_letter_subj
        f.input :message_text, :input_html => {:rows => 3, :class => 'code_area'}

        f.input :admin_label_menu
        f.input :admin_label_settings
        f.input :admin_label_bids
      end
      f.actions
    end

  end
end