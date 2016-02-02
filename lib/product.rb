class Product
  attr_reader :title, :price, :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end

  def self.find_by_title(name)

    @@products.each do |product|
      if product.title == name
        return product
      end
    end
  end

  def self.in_stock
    in_stock = []

    @@products.each do |product|
      unless product.stock == 0
        in_stock << product
      end
    end

    return in_stock
  end

  def in_stock?
    @stock.to_i > 0 ? true : false
  end

  def reduce_stock
    unless @stock == 0
      @stock = @stock - 1
    else 
      raise OutOfStockError, "'LEGO Firehouse Headquarter' is out of stock."
    end
  end

  private

  def add_to_products
  	@@products.each do |product|
      if product.title == self.title
        raise DuplicateProductError, "'#{self.title}' already exists"
      end
    end
    @@products << self
  end

end