class UrlValidator < ActiveModel::EachValidator
  URL_REGEX =
    /\A
    (?:https?\:\/\/)?                                       # protocol
    (?:[a-z0-9\-]+\.?)*[a-z0-9]{2,}\.[a-z]{2,}              # domain
    (?:[:]\d+)?                                             # port
    (?:\/[a-zA-Z0-9\-\._\?\,\'\/\+&%\$#\=~]*)?              # path and query
    \z/x


  def validate_each(record, attribute, value)
    return if options[:allow_blank] && value.blank?

    unless value =~ URL_REGEX
      record.errors[attribute] <<
        (options[:message] || I18n.t("activerecord.errors.messages.not_a_url"))
    end
  end
end
