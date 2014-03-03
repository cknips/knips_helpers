class UrlValidator < ActiveModel::EachValidator
  PROTOCOL   = /(?:(?:http|https)\:\/\/)?/
  DOMAIN     = /([a-z0-9\-]+\.?)*([a-z0-9]{2,})\.[a-z]{2,}/
  NUMERIC_IP = /\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/
  PORT       = /(([:]\d+)?)/
  PATH       = /\/?[a-zA-Z0-9\-\._\?\,\'\/\\\+&%\$#\=~]/

  URL_REGEX  = /\A#{PROTOCOL}((localhost)|#{DOMAIN}|#{NUMERIC_IP})#{PORT}#{PATH}\z/


  def validate_each(record, attribute, value)
    return if options[:allow_blank] && value.blank?


    unless value =~ URL_REGEX
      record.errors[attribute] <<
        (options[:message] || I18n.t("activerecord.errors.messages.not_a_url"))
    end
  end
end
