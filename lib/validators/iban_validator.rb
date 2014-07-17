class IbanValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value == nil
    return if options[:allow_blank] && value.blank?

    if value.length != 22
      record.errors[attribute] <<
        (options[:message] || I18n.t("activerecord.errors.messages.not_an_iban"))
      return
    end

    value.gsub!(/\s+/, "")
    iban = value.gsub(/[A-Z]/) { |p| p.ord - 55 }
    unless (iban[6..iban.length-1].to_s + iban[0..5].to_s).to_i % 97 == 1
      record.errors[attribute] <<
        (options[:message] || I18n.t("activerecord.errors.messages.not_an_iban"))
    end
  end
end

