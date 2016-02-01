class Transaction
	attr_reader :id, :customer, :product

	@@counter = 0

	def initialize(customer, product)
		@customer = customer
		@product = product
		@id = id_counter
		stock_reduce
	end

	def id_counter
		@id = @@counter
		@@counter += 1
	end

	def stock_reduce
		@product.reduce_stock
	end
end