#encoding: utf-8
class Array
  # convert to arg list - similar to flatten, but only if 1st arg is an array
  def to_sargs
    size == 1 && (a = at(0)).is_a?(Array) ? a : self
  end
end

class Hash

  def delete_keys(*keys)
    keys.a_to_sargs.inject({}) { |h, k| h[k] = delete(k) if has_key?(k); h }
  end

  # Remove the key that has value 'empty' or nil (not false).
  # Note: It works only for one dimensional hash and dont trim leading/trailing spaces
  def except_empty
    self.reject{|k, v| v.to_s.empty?}
  end

  def except_empty!
    self.delete_if{|k, v| v.to_s.empty?}
  end

  # includes keys
  def includes?(*keys)
    keys.to_sargs.all? {|k| key?(k) }
  end

  # includes keys w/o empty strings
  def includes!(*keys)
    keys.to_sargs.all? {|k| v = self[k]; !v.nil? && !(v.is_a?(String) && v.empty?) }
  end

  # return only those keys listed
  def only(*keys)
    keys = keys.to_sargs
    self.select { |k| keys.include?(k) } || self
  end

  def only!(*keys)
    keys = keys.to_sargs
    self.keep_if { |k| keys.include?(k) }
  end

  # fetch param if not nil or empty string
  def param(k)
    v = self[k.to_sym] || self[k.to_s]
    v && !(v.is_a?(String) && v.empty?) ? v : nil
  end

  def symbolize(recurse = true)
    self.inject({}) do |h, (k, v)|
      h[k.to_sym] = recurse && (v.is_a?(Array) || v.is_a?(Hash)) ? v.symbolize : v
      h
    end
  end

  def symbolize!(recurse = true)
    keys.each do |k|
      if k.is_a?(String)
        store(k.to_sym, v = delete(k))
      else
        v = self[k]
      end
      v.symbolize! if recurse && (v.is_a?(Array) || v.is_a?(Hash))
    end
    self
  end

  # return all keys except those listed
  def without(*keys)
    keys = keys.to_sargs
    self.reject { |k| keys.include?(k) } || self
  end

  def without!(*keys)
    keys = keys.to_sargs
    self.delete_if { |k| keys.include?(k) }
  end

end

class String

  # Only capitalize first letter of a string
  def capitalize_first
    self.sub(/^(.)/) { $1.capitalize }
  end

  # check if a string is numeric "12" is numeric while "aa" is not
  # Ref. http://mentalized.net/journal/2011/04/14/ruby_how_to_check_if_a_string_is_numeric/
  def numeric?
    Integer(self) != nil rescue false
  end

  def to_bool
    return true if ['t', 'true', '1', 'yes'].include?(self)
    return false if ['f', 'false', '0', 'no'].include?(self)
    raise ArgumentError, :not_a_boolean_value_t_f_1_0_yes_no
  end

end