require_relative '../config/environment'
require_relative '../cli.rb'

# puts Flight.all
cli = CommandLineInterface.new
# cli.run
# p cli.find_flight_by_flight_num(1354)
# p cli.get_passenger_info
# p cli.create_a_passenger
# p Passenger.all
# p  cli.book_a_flight
p Ticket.all
# input = gets.chomp.to_i

# case input
# when 1
#   puts "Show all flights"
#   Flight.find(1).name
#
# when 2
#   puts "Book a ticket"
#
# when 3
#   puts "show all my flights"
#
# when 4
#   puts "print my ticket"
# else
#   exit
# end
#
# i =0
# until  == 10
#
# end
