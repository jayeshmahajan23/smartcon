class AlphaNumericValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    record.errors.add attribute, (options[:message] || :alpha_numeric_only) unless
      value =~ /^[0-9a-zA-Z ]+$/
  end
end