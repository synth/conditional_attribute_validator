# ConditionalAttributeValidator

## Installation

Add this line to your application's Gemfile:

    gem 'conditional_attribute_validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install conditional_attribute_validator

## Example Usage

class User
  include ConditionalAttributeValidator
  
  validate :login, :email, :password, :password_confirmation, :presence => true
  validate :login, :email, :uniqueness => true
  
  #the attribute validation needs to be specified after all other validations have been set
  validate_attribute_with_condition :login, :if => :has_another_form_of_authentication?

  #also, there is a grammar for multiple attributes
  #and we support :if/:unless conditions
  validate_attribute_with_condition :login, :email, :password, :password_confirmation, :unless => :has_another_form_of_authentication?
  
  protected
  def has_another_form_of_authentication?
    #your app specific logic here
  end
  
end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
