# Devise::Acquirable

[![Gem Version](https://badge.fury.io/rb/devise-acquirable.svg)](https://badge.fury.io/rb/devise-acquirable)

> This project started as a fork of nate's [n8/devise_marketable](https://github.com/n8/devise_marketable) project.

Acquirable lets [Devise](https://github.com/plataformatec/devise) implementers easily store where a user came from and where they were going in your Rails app.

With Acquirable, Devise will automatically create two cookies for your users when they first visit your app, the referring_url (where they came from) and the landing_url (where they landed). When the user registers with your application, the values in those cookies are stored alongside your user data.

## Installation

1. Add 'devise-acquirable' to your Gemfile.

```ruby
gem 'devise-acquirable'
```

2. Run `bundle install`
3. Add the marketing fields to your user table:

```shell
rails g devise-acquirable MODEL
```

MODEL is probably `User`. It's what you attach Devise to. (e.g. User, Admin, Account)

```shell
rails g devise-acquirable User
```

4. Run your migration

```shell
bundle exec rails db:migrate
```

5. Check `:acquirable` was added to the `devise` call in your model by the `devise:acquirable` generator

```ruby
devise :database_authenticatable, ..., :acquirable
```

6. Restart your server

That's it. You now have some very powerful data: where your best customers come from, what traffic sources are your most lucrative, what on your website converts the best, what people are most interested in, etc.

## Feedback

[Source code available on Github](https://github.com/simonlehmann/devise-acquirable). Feedback and pull requests are greatly appreciated.
