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
    #index = @@products.index(title).to_i
    #@@products.fetch(index)
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
        in_stock_array << product
      end
    end

    return in_stock
  end

  def in_stock?
    @stock.to_i > 0 ? true : false
  end

  private

  def add_to_products
  	if !@@products.to_s.include?(self.title)
  		@@products << self
  	else 
  		raise DuplicateProductError, "'#{@title}' already exists"
  	end
  end
end