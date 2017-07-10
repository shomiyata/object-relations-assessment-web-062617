class Review
  attr_accessor :customer, :restaurant, :content

  @@all = []

  def initialize(restaurant, content)
    @restaurant = restaurant
    @content = content
    @@all << self
    restaurant.reviews << self
  end

  def self.all
    @@all
  end
end
