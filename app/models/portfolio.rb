class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image

    # custom scope
    # first way
    def self.angular
        where(subtitle: 'Angular')
    end

    # second way
    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
end