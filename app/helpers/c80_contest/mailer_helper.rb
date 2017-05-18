module C80Contest
  module MailerHelper
    def format_message(bid)

      m = Setting.first.message_text

      m = m.gsub!('{title}',bid.title)
      m = m.gsub!('{phone}',bid.phone)
      m = m.gsub!('{bid_id}',bid.id.to_s)
      m = m.gsub!('{photo_url}',bid.photo.url.to_s)

      m
    end
  end
end