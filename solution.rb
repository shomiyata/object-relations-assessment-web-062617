# Please copy/paste all three classes into this file to submit your solution!
class Customer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    all.detect { |customer| customer.full_name == name }
  end

  def self.find_all_by_first_name(name)
    all.select { |customer| customer.first_name == name }
  end

  def self.all_names
    all.collect { |customer| customer.full_name }
  end

  def add_review(restaurant, content)
    review = Review.new(restaurant, content)
    review.customer = self
  end
end

class Restaurant
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @reviews = []
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    all.detect { |restaurant| restaurant.name == name }
  end

  def reviews
    @reviews
  end

  def customers
    self.reviews.collect { |review| review.customer }
  end
end

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
