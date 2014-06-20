require 'date'
require './book.rb'
require './order.rb'
require './customer.rb'

include Lib_orders

module Lib_orders
	class Library

	  def initialize
	    @orders = []
	  end

	  def add_order order
	    @orders.push order
	  end

	  #the smallest period for which library found a book
	  def min_period
	  	min = nil
	  	full_ordered = @orders.select {|order| !order.issue_date.nil?}
	  	full_ordered.each do |order|
	  	  period = order.order_date - order.issue_date
	  	  min = period if min.nil? || period < min
	  	end
	  	min
	  end
	  #how many orders were not satisfied
	  def no_satisfy
	    @orders.count {|order| order.issue_date.nil?}
	  end
	  #who often takes the book
	  def who_often_takes
	  	hash = Hash.new(0)
		res = @orders.each { |order| hash[order.name] += 1 } 
		hash.max{|a, b| a.length <=> b.length}
	  end
	  #what is the most popular book
	  def best_book
		books = Hash.new(0)
    	@orders.each { |order| books[order.book.title] += 1 }  
    	books.max{|a, b| a.length <=> b.length}
	  end
	  #how many people ordered one of the three most popular books.
	  def who_ordered_best_book
		books = Hash.new(0)
	    @orders.each { |order| books[order.book.title] += 1 }
	    books = books.sort_by(&:last).take(3).map(&:first)
	    readers = []
	    @orders.each { |order| readers << order.name if books.include? order.book.title }
	    readers.uniq.size
	  end

	end
end