module Lib_orders
	class Customer
	  attr_reader :first_name, :last_name

	  def initialize customer={}
	  	@first_name, @last_name = customer[:first_name], customer[:last_name]
	  end

	  def name
	  	"#{self.first_name} #{self.last_name}"
	  end
	end
end