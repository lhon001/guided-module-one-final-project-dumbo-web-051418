require_relative '../config/environment'
require_relative '../cli.rb'

# puts Flight.all
 cli = CommandLineInterface.new
# cli.run
#
# input = gets.chomp.to_i
#
# case input
# when 1
#   puts "Show all flights"
#   puts Flight.find(1).name
#
# when 2
#   puts "Book a ticket"
#
# when 3
#   puts "show all my flights"
#
# when 4
#   puts "print my ticket"
#
# end

cli.show_all_passengers_flights("Hart", "Val")
#cli.show_all_flights
