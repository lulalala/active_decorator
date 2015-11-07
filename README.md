# ActivePresenter - forked from ActiveDecorator

...where you can put your view helpers if they are **very closely** related to ActiveModel.

This solves one very important computer science problem: naming your helper methods. All great programmers feels uneasy seeing:

* `auction_title(@auction)`
* `board_title(@board)`
* `category_title(@category)`

and this gem will solve it.

## Supported versions ##

Rails 3.0.x, 3.1.x, 3.2.x, 4.0.x, 4.1.x, 4.2.x, and 5.0 (edge)


## Usage ##

1. put `gem 'active_presenter', github:'lulalala/active_presenter'` in Gemfile and then `bundle install`.
2. create a presenter class for each AR model you wish to present. For example, a decorator for a model `User` should be named `UserPresenter`.
3. access this presenter from the model like this: `record.presenter`, and from there call the helper methods.
2. call any ActionView's helper methods using `h`, e.g. `h.content_tag` or `h.link_to`.


## Examples ##

```ruby
# app/models/user.rb
class User < ActiveRecord::Base
  # first_name:string last_name:string website:string
end

# app/presenters/user_presenter.rb
module UserPresenter
  def full_name
    "#{model.first_name} #{model.last_name}"
  end

  def link
    h.link_to model.full_name, model.website
  end
end

# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def index
    @users = User.all
  end
end
```
```erb
# app/views/users/index.html.erb
<% @users.each do |user| %>
  <%= user.presenter.link %><br>
<% end %>
```

## Reason for fork ##

It's difficult to decorate models automatically. Leaky abstractions can happen easily. Having a presenter class that can be accessed from model would not have that issue at all.
Even though more typing is needed, I think it is good for establishing the awareness that presenter helpers are different to model methods.

## Contribute ##

* Fork, fix, then send me a pull request.


## Copyright ##

Copyright (c) 2011 Akira Matsuda. See MIT-LICENSE for further details.

