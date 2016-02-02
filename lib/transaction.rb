class Transaction
	attr_reader :id, :customer, :product

	@@transactions = []
	@@counter = 0

	def initialize(customer, product)
		@customer = customer
		@product = product
		@id = id_counter
		@@transactions << self
		stock_reduce
	end

	def self.all 
		@@transactions
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