class ZipValidator < ActiveModel::EachValidator
  ZIP_REGEX = /\A[0-9]{5}\z/

  def validate_each(record, attribute, value)
    return if options[:allow_blank] && value.blank?


    unless value =~ ZIP_REGEX
      record.errors[attribute] <<
        (options[:message] || I18n.t("activerecord.errors.messages.not_a_zip"))
    end
  end
end
