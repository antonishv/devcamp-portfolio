# Devcamp Portfolio Application

> This is a Ruby on Rails 5 Application that allows users to create their own portfolios.

### Features

- Real time chat engine for comments
- Blog
- Portfolio
- Drag and drop interface

### Code Example

```ruby
def my_gret_method
    puts "here it is"
end
```

### Generate code via Controller generator

```ruby
    rails g controller CONTROLLER_NAME METHOD_NAME METHOD_NAME METHOD_NAME
```

### Get specific routes
```ruby
    rake routes | grep portfolio
```

### Nested routes
```ruby
    namespace :admin do
        # move controller to admin directory
        # move view to admin directory
        get 'dashboard/main'
    end
```

### Add relation
```ruby
    rails g migration AddTopicReferenceToBlogs topic:references
```

### Access relation
```ruby
    t = Topic.first
    t.blogs

    Blog.last.topic
```
