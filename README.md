# FormObject

[![Build Status](https://travis-ci.org/saratovsource/form_object.png)](https://travis-ci.org/saratovsource/form_object)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/saratovsource/form_object)
[![Dependency Status](https://gemnasium.com/saratovsource/form_object.png)](https://gemnasium.com/saratovsource/form_object)
[![Coveralls](https://coveralls.io/repos/saratovsource/form_object/badge.png?branch=develop)](https://coveralls.io/r/saratovsource/form_object)

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'form_object'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install form_object

## Usage

We have a model

``` ruby
class User < ActiveRecord::Base
end

# attributes => {email: "test@example.com", name: "name"}
```

Define forms:

``` ruby
# For base auth
class BaseAuthForm < FormObject::Base
  map_model User, as: :base_auth
  attribute :email, String # => map form attribute to model attribute

  validates :email, presence: true # => validate email in form ONLY!
end

# For any other auth
class TwitterAuthForm < FormObject::Base
  map_model User      # name => twitter_auth (name will be generated 
                      # automatically from class name)
                      # There is nothing to validate
end
```

In any place:

``` ruby
  @user = User.find(params[:id])
  @form = @user.form( :base_auth ) # This retrive BaseAuthForm instance
                                  # with attributes from model
  @form.assign_attributes(params[:user]) # assign attributes from hash

  if @form.valid?
    @form.persist_model           # TODO: maybe other method name?
  end
```

## Can I help you?

Discuss the existing features and offer new features you can
[here](https://groups.google.com/d/forum/formobject "FormObject").

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
