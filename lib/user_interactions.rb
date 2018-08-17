require 'pry'
require './lib/event'
require './lib/games'

# Ask and wait for user input for year of the games
puts "Welcome to the Super Sports Games of..." + "\n" + "Wait what year is it?"
year = gets.chomp.to_s

# create a new instance of the Game class using user input
the_games = Games.new(year)

# Ask and wait for user input to add events
puts "Are there any events you would like to add?" + "\n" + "yes or no"
adding_event = gets.chomp

while adding_event == "yes" do
  # If yes do this block

  # Ask and wait for user input to name a new event
  puts "What is the name of the event?"
  event_name = gets.chomp.to_s

  # Ask and wait for user input to add participant ages to the new event
  puts "What are the ages of the participants?" + "\n" + "Please list their ages seperates by commas like so:" + "\n" + "1, 2, 3, 4, 5"

  # Take ages input and convert to array of integers
  participant_ages = gets.chomp.to_s.chars
  participant_ages.delete_if { |unwanted| unwanted == " " || unwanted == "," }

  # create new event based on user input
  new_event = Event.new(event_name, participant_ages)

  #add new event to the games
  the_games.add_event(event_name)

  puts "Are there any other events you would like to add?\nyes or no"
  adding_event = gets.chomp

end
# if no skip loop above

# ask and wait for user input to display event summaries
puts "Would you like to see a summary of all the events?" + "\n" + "yes or no"
get_events_summary = gets.chomp.to_s

# If they say "yes" print the first string otherwise print second
if get_events_summary == "yes"
  if the_games.events.length == 1
    p "The Super Sports Games of #{the_games.year} will only be hosting #{the_games.events.join(', ')} this year!"
  else
    p "#{the_games.events.join(', ')} are the events we are hosting the Super Sports Games of #{the_games.year}!"
  end
else
  puts "You'll never know what events we're holding at the #{the_games.year} Super Sports Games!~!"
end
