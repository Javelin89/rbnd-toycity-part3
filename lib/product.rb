class Product
  attr_reader :title, :price, :stock

  @@products = []


  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all #returns @@products array
    @@products
  end

  def self.find_by_title(name) #returns the product of which the name is given
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

def discount(discount_percent)
  percent = discount_percent/100
  @price = (@price*(1 - percent.to_f)).round(2)
end


def discount_calc(sale_price)
  (@price - sale_price.to_f).round(2)
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