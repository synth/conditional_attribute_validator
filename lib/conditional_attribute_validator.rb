require "conditional_attribute_validator/version"
require "conditional_attribute_validator/class_methods.rb"

module ConditionalAttributeValidator
  def self.included(klass)
    klass.extend ClassMethods
  end
end

