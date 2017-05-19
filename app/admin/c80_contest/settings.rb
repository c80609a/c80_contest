if defined?(ActiveAdmin)
  ActiveAdmin.register C80Contest::Setting do

    if ActiveRecord::Base.connection.table_exists?('c80_contest_settings')
      begin
        menu :parent => C80Contest::Setting.first.admin_label_menu,
             :label => C80Contest::Setting.first.admin_label_settings if C80Contest::Setting.first.present?
      rescue NoMethodError => e # NOTE:: ошибка возникает во время миграции
        puts "[TRACE] <Admin.settings> #{e}"
      end
    end

    # noinspection RubyResolve
    before_filter :skip_sidebar!, :only => :index

    controller do

      def update
        setting = C80Contest::Setting.find(params[:id])
        permitted_params[:setting].each_key do |k|
          if k == 'button_photo'
            # byebug
            # noinspection RubyResolve
            setting.button_photo = permitted_params[:setting][k]
            setting.save!
          else
            setting.update_column(k, permitted_params[:setting][k])
          end
        end
        # noinspection RailsParamDefResolve
        redirect_to :action => :index
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
                :mail_to,
                :is_active,
                :button_photo
            ]
        )
      end
    end

    index do
      column do |s|
        a = ''
        s.attribute_names.sort.each do |n|
          next if n =~ /message_text|created_at|updated_at|id/
          sn = s[n]

          # особым образом выведем фотку
          if n == 'button_photo'
            if s[n].nil?
              sn = '<картинка баннера не загружена>'
            else
              sn = "<img src='#{# noinspection RubyResolve
              s.button_photo.url}'/>"
            end
          end

          # особым образом выведем правила
          if n == 'rules' && sn.present?
            tmp = ActionView::Base.full_sanitizer.sanitize(sn)

            t = tmp.gsub("\n",'')
            s = t unless t.nil?

            t = s.gsub("\t",' ')
            s = t unless t.nil?

            t = s.gsub("\r",'')
            s = t unless t.nil?

            t = s.gsub(/&\w+;/,'*')
            s = t unless t.nil?

            ah = "<a href='/rules_page' target='_blank' style='text-decoration: underline;'>Просмотреть</a>"
            sn = "#{tmp[0..129]}... <em style='color:#2b2b2b;'>(знаков с пробелами: ~#{s.size})</em> #{ah}"
          end

          a += "<li><em>#{n}:</em>#{sn}</li>"
        end
        "<ul>#{a}</ul>".html_safe
      end

      actions
    end

    form(:html => {:multipart => true}) do |f|
      f.inputs do
        f.input :is_active
        f.input :form_title
        f.input :form_label_name
        f.input :form_label_phone
        f.input :form_label_photo
        f.input :form_label_button_send
        f.input :form_label_button_sending
        # noinspection RubyResolve
        f.input :button_photo, :hint => "#{image_tag(f.object.button_photo.url)}".html_safe
        f.input :rules, :as => :ckeditor
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