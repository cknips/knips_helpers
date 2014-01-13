class EmailValidator < ActiveModel::EachValidator
  EMAIL_REGEX = /\A([\w-\.\+]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
  def validate_each(record, attribute, value)
    return if options[:allow_blank] && value.blank?


    unless value =~ EMAIL_REGEX
      record.errors[attribute] <<
        (options[:message] || I18n.t("activerecord.errors.messages.not_an_email"))
    end
  end
end
