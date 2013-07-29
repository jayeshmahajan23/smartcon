class EmailFormatValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    record.errors.add attribute, (options[:message] || :valid_email) unless
      value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/
  end
end