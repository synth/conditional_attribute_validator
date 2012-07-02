module ConditionalAttributeValidator

  module ClassMethods
  
    ####################################################################################
    # 
    #  validate_attribute_with_condition(attr, opts={})
    #
    #  this must be specified AFTER all other validations have been attached to the model
    #  other it will miss some validations
    #
    #  I wish there was a better way to put a conditional validation on an attribute
    #  Rails stores validations as hash of :attr => [LengthValidator,PresenceValidator, etc]
    #  It would be nice if there was a high level api to say, only run validations on :name
    #  if a certain condition is true
    #  
    #  But for now we need to attach the condition by merging attributes to each individual
    #  validator
    #
    def validate_attributes_with_condition(*args)
      opts = args.extract_options!
      raise "Must have an :if or :unless option" unless opts.has_key?(:if) or opts.has_key?(:unless)

      merge_methods = self.methods.grep(/merge_.*_options/)
      args.each do |field|
        merge_methods.grep(/#{Regexp.quote(field)}/).each do |m|
          self.send(m, {:unless => :has_omni_authentication?})
        end
      end
    end
  
    #better grammar if only one attribute
    def validate_attribute_with_condition(*args)
      validate_attributes_with_condition(*args)
    end
  end    
  
end