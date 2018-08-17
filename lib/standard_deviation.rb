# inputs
ages = [24.0, 30.0, 18.0, 20.0, 41.0]

def standard_deviation(ages)
  # Your code here for calculating the standard deviation\
  # summing the ages of all the athletes.
  summed_ages = sum_array(ages)
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
    squared << minus_average * minus_average
  end
  return squared
end

# When you find the standard deviation, print it out!
puts "The standard deviation for the athletes' ages is #{standard_deviation(ages)} years."
