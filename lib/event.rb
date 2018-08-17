require 'pry'
class Event
  attr_reader :name, :ages

  def initialize(name, ages)
    @name = name
    @ages = ages
  end

  def max_age
    max_age =  @ages.sort { |x,y| y <=> x }.first
    return max_age
  end

  def min_age
    min_age = @ages.sort { |x,y| y <=> x }.last
    return min_age
  end

  def average_age
    summed_ages = 0.0
    @ages.each do |digit|
      summed_ages += digit
    end
    ages_length = @ages.length
    average_age = summed_ages / ages_length
  end

  def standard_deviation_age
    # Calculating the standard deviation\
    # summing the ages of all the athletes.
    summed_ages = sum_array(@ages).to_f
    # find number of integers in ages[]
    ages_length = ages.length
    # find average age of athletes
    average_age = summed_ages / ages_length
    # subtract average_age from each age
    minus_averages = minus_average(ages, average_age)
    # and square each value in ages
    squared = square_minus_average(minus_averages)
    # sum new values in ages
    summed_new = sum_array(squared)
    # calculate, round to 2 decimals and store the standard_deviation
    standard_deviation =  Math.sqrt(summed_new / ages_length).round(2)
    # binding.pry
  end

  def sum_array(array)
    summed_array = 0
    array.each do |digit|
      summed_array += digit
    end
    return summed_array
  end

  def minus_average(ages, average_age)
    minus_averages = []
    ages.each do |age|
      minus_averages << age - average_age
    end
    return minus_averages
  end

  def square_minus_average(minus_averages)
    squared = []
    minus_averages.each do |minus_average|
      squared << minus_average ** 2
    end
    return squared
  end

end
curling = Event.new("Curling", [24, 30, 18, 20, 41])
p curling.standard_deviation_age
