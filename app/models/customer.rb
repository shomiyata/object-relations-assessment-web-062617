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
