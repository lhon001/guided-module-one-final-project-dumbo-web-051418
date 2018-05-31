require_relative '../config/environment'
require_relative '../cli.rb'

# puts Flight.all
cli = CommandLineInterface.new
cli.run
# cli.reschedule_a_flight
# p cli.find_flight_by_flight_num(1354)
# p cli.get_passenger_info
# p cli.create_a_passenger
# p Passenger.all
# cli.book_a_flight
# Ticket.all
# p Passenger.all
# input = gets.chomp.to_i


#
# i =0
# until  == 10
#
# end
