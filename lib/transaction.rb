class Transaction
	attr_reader :id, :customer, :product, :sale_price

	@@transactions = []
	@@counter = 0

	def initialize(customer, product, sale_price)
		@customer = customer
		@product = product
		@id = id_counter
		@sale_price = sale_price
		@discount = 0
		discount
		@@transactions << self
		stock_reduce
	end

	def self.all 
		@@transactions
	end

	def discount
		@discount = @product.discount_calc(@sale_price)
	end

	def id_counter
		@id = @@counter
		@@counter += 1
	end

	def stock_reduce
		@product.reduce_stock
	end

	def self.find(index)
		@@transactions.fetch(index - 1)
	end
end