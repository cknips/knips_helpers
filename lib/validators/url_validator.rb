class UrlValidator < ActiveModel::EachValidator
  PROTOCOL       = /(?:(?:http|https)\:\/\/)?/
  DOMAIN         = /([a-z0-9\-]+\.?)*([a-z0-9]{2,})\.[a-z]{2,}/
  PORT           = /(([:]\d+)?)/
  PATH_AND_QUERY = /\/?[a-zA-Z0-9\-\._\?\,\'\/\\\+&%\$#\=~]*[^\.\,\s]/

  URL_REGEX      = /\A#{PROTOCOL}#{DOMAIN}#{PORT}#{PATH_AND_QUERY}\z/


  def validate_each(record, attribute, value)
    return if options[:allow_blank] && value.blank?

    unless value =~ URL_REGEX
      record.errors[attribute] <<
        (options[:message] || I18n.t("activerecord.errors.messages.not_a_url"))
    end
  end
end
