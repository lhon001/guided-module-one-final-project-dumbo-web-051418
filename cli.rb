class CommandLineInterface
  def greet
    puts "Hi, Welcome to Flight Booker!"
  end

  def menu
    puts "1. Show all flights"
    puts "2. Book a ticket"
    puts "3. Show all my flights"
    puts "4. Print my ticket"
    puts ""
    puts "Enter a option number (1-4)"
  end

  def book_a_flight
    flight_id = find_flight_by_flight_num(1354)
    passenger = create_a_passenger
    Ticket.create(ticket_num: random_number_gernerator, passenger_id: passenger.id, flight_id: flight_id)
  end

  def run
    greet
    puts ""
    menu
  end



####
# Helper methods
###
  # takes a flight num as an argument and return the flight id
  def find_flight_by_flight_num(flight_num)
     flight = Flight.find_by(flight_number: flight_num)
     flight.id
  end

  def create_a_passenger
    new_passenger = get_passenger_info
    Passenger.create(first_name: new_passenger[0], last_name: new_passenger[1], age: new_passenger.last )
  end

  #Ask the Passenger for their personal info
  def get_passenger_info
    info = []
    puts "Please enter your First Name:"
    info << gets.chomp
    puts "Please enter your Last Name:"
    info << gets.chomp
    puts "Please enter your  Age:"
    info << gets.chomp.to_i
  end
  def random_number_gernerator
    1 + rand(10000 + 1)
  end




end
