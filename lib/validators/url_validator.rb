class UrlValidator < ActiveModel::EachValidator
  PORT       = /(([:]\d+)?)/
  DOMAIN     = /([a-z0-9\-]+\.?)*([a-z0-9]{2,})\.[a-z]{2,}/
  NUMERIC_IP = /\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/

  URL_REGEX  = /\A((localhost)|#{DOMAIN}|#{NUMERIC_IP})#{PORT}\z/
  

  def validate_each(record, attribute, value)
    return if options[:allow_blank] && value.blank?


    unless value =~ URL_REGEX
      record.errors[attribute] <<
        (options[:message] || I18n.t("activerecord.errors.messages.not_a_url"))
    end
  end
end
