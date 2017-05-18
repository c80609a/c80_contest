module C80Contest
  module MailerHelper
    def format_message(bid)

      # noinspection RubyResolve
      m = Setting.first.message_text

      tmp = m.gsub!('{title}',bid.title)
      m = tmp unless tmp.nil?

      tmp = m.gsub!('{phone}',bid.phone)
      m = tmp unless tmp.nil?

      tmp = m.gsub!('{bid_id}',bid.id.to_s)
      m = tmp unless tmp.nil?

      tmp = m.gsub!('{photo_url}',bid.photo.url.to_s)
      m = tmp unless tmp.nil?
      m
    end
  end
end