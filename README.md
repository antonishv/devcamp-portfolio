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
    # it will add topic_id to blogs table
    # topic has many blog, blog belongs to topic
```

### Access relation
```ruby
    t = Topic.first
    t.blogs

    Blog.last.topic
```

### Cheatseet references

> https://gist.github.com/jessieay/3131622
> https://cheatography.com/dwapi/cheat-sheets/rails-5-activerecord-queries/

- Concern -> helper with data related to share accross the model
- Lib -> helper with no data related

- method parameter follow by " : " means we should include the parameter name when using the method 

```ruby
    # set default value in model
    after_initialize :set_defaults

    def set_defaults
        self.main_image ||= "http://placehold.it/600x400"
        self.thumb_image ||= "http://placehold.it/350x200"
    end


    # Nested atrributes
    accepts_nested_attributes_for :technologies, reject_if: lambda { |attrs| attrs['name'].blank? }
    
    Portfolio.create!(title: "Web app", subtitle: "asdasd", body: "asdasdasd", technologies_attributes: [{name: "Ruby"}, {name: "Rails"}, {name: "Angular"}, {name: "Ionic"}])
```

> Active Record Query

- https://guides.rubyonrails.org/active_record_querying.html

```ruby
    find_by_field #only get 1 data
    vader = Author.find_by_name("Vader")
    vader.books.sum(:sales) #:sales is the field in db
    Book.average(:sales).to_f
    Book.maximum(:sales)
    Book.order('sales DESC')
    Book.order('sales DESC').first
    Book.order('sales DESC').first.author.name

    # Has Many Through
    # Case => Author would like to know all the genre, Genre would like to know all the Author

    # Author Model
    has_many :genres, through: :books

    # Genre Model
    has_many :authors, through: :books

    Author.first.genres
    Genre.first.authors

    # return an array of name
    Genre.pluck(:name)
    Author.pluck(:name)
    Book.pluck(:title)
    vader_new.books.pluck(:title)
    Author.ids # return all of authors id

    # Solve N+1 problem / eager loading
    @books = Book.includes(:author, :genre)
```

### View Helper

- Use View Helper if has conditional otherwise use Partial (Majority HTML Code)
- distance_of_time_in_words(blog.created_at, Time.now) = ... seconds ago
- number_to_phone "5555555555"
- https://guides.rubyonrails.org/action_view_helpers.html
- https://guides.rubyonrails.org/form_helpers.html
- render partial: @blogs, spacer_template: "blog_ruler" => example blog_ruler contain <hr> then it will render it every loop (no render on last)

```ruby
    <%= cache do %>
        <div>
            <%= render partial: @blogs, spacer_template: 'blog_ruler' %>
        </div>
    <% end %>
```

### Debugging

- use pry-debug
- put binding.pry , next for next step, j for up, k for down, q for back to normal