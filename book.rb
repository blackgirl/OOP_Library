module Lib_orders
	class Book
	  attr_reader :title, :author, :year

	  def initialize book={}
	  	@title, @author, @year = book[:title], book[:author], book[:year]
	  end
	end
end