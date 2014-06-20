module Lib_orders
	class Order
	  attr_reader :name, :date, :issue_date, :order_date

	  def initialize order={}
	    @name, @date, @issue_date, @order_date = order[:name], order[:date], order[:issue_date], order[:order_date]
	  end
	end
end