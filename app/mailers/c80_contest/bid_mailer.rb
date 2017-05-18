module C80Contest
  class BidMailer < ActionMailer::Base

    include C80Contest::MailerHelper

    default from: Proc.new { Setting.first.mail_from },
            to: Proc.new { Setting.first.mail_to }

    def send_letter(bid)

      subj = Setting.first.message_letter_subj

      # Rails.logger.debug "<BidMailer.send_letter> subj: #{subj}, #{bid.as_json}"
      @message = format_message(bid)

      # puts '<BidMailer.send_letter> Отправляем сообщение.'
      mail(subject: subj) do |format|
        format.html { render inline: '<%= @message.html_safe %>'}
      end

      #puts "#{SiteProps.first.mail_to}"
    end

  end
end
