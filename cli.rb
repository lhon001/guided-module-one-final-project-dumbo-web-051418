class CommandLineInterface
  def greet
    puts "Hi, Welcome to Flight Booker!"
  end

  def menu
    # system("clear")
    puts "1. Show All Flights"
    puts "2. Book a Flight"
    puts "3. Show All My Flights"
    puts "4. Show All Passenger Info"
    puts "5. Cancel a Flight"
    puts "6. Print My Ticket"
    puts "7. Exit"
    puts "Enter an Option Number (1-4)"
  end

  #return all flights
  def show_all_flights
    show_flights(Flight.all)
  end

  def show_all_passenger
    show_all_passenger_info(Passenger.all)
  end

  # Creates a Ticket object
  def book_a_flight
    puts "Please select a Flight Number"
    input = gets.chomp.to_i
    flight_id = find_flight_by_flight_num(input)
    passenger = create_a_passenger
    Ticket.create(ticket_num: random_number_generator, passenger_id: passenger.id, flight_id: flight_id)
  end

  def cancel_a_flight
    puts "Please enter your passport number"
    passport_number = gets.chomp
    passenger = Passenger.find_by_passport_num(passport_number)
    show_all_passengers_flights(passport_number)

    puts "Select flight number you would like to cancel"
    flight_num = gets.chomp.to_i
    flight_id_num = find_flight_by_flight_num(flight_num)#returns flight objects id
    ticket = Ticket.find_by(flight_id: flight_id_num)
    ticket.id
    Ticket.destroy(ticket.id)
    puts "Your flight #{flight_num} has been cancelled"
  end

  def show_all_passengers_flights(passport_number)
    my_flights = Passenger.find_by(passport_num: passport_number)
    show_flights(my_flights.flights)
  end


  def run
    greet
    menu
    input = gets.chomp
    until input.to_i == 7
      #system("clear")
      option(input)
      menu
      input = gets.chomp
    end
    puts "Thank You for using Flight Booker! Have a Great Trip!"
  end



####
# Helper methods
###
  # takes a flight num as an argument and return the flight id
  def find_flight_by_flight_num(flight_num)
     flight = Flight.find_by(flight_number: flight_num)
     flight.id
  end

  def find_ticket(flight_num)
    Ticket.find_by(flight_id: find_flight_by_flight_num(flight_num))
  end

  def create_a_passenger
    new_passenger = get_passenger_info
    Passenger.find_or_create_by(first_name: new_passenger[0], last_name: new_passenger[1], passport_num: new_passenger.last )
  end

  def show_flights(flights)
   flights.each do |flight|
     puts "|---------------------------------------|"
     puts "| Airline     | #{flight.name}"
     puts "|---------------------------------------|"
     puts "| Depart Time | #{flight.departure_time}"
     puts "|---------------------------------------|"
     puts "| Departure   | #{flight.start_location}"
     puts "|---------------------------------------|"
     puts "| Destination | #{flight.end_location}"
     puts "|---------------------------------------|"
     puts "| Flight Num. | #{flight.flight_number}"
     puts "|---------------------------------------|"
     puts ""
   end
 end

 def show_all_passenger_info(passengers)
   passengers.each do |passenger|
     passenger.pretty_print
   end
 end


  def option(input)
    if input == "Elon Musk"
      musk_method
    end

    case input.to_i
    when 1
      puts "Show all flights"
      show_all_flights
    when 2
      puts "Book a flight"
      booked_flight = book_a_flight
      puts "Your flight has been booked, remember to print your ticket"
      #sleep(1)
    when 3
      puts "Please Enter Passport Number"
      passport_number = gets.chomp
      show_all_passengers_flights(passport_number)
    when 4
      puts "All Passengers Information"
      show_all_passenger
    when 5
      puts "Cancel a flight"
      cancel_a_flight
    when 6
      puts "Print a ticket"
      puts "Please enter your flight number"
      flight_num = gets.chomp
      find_ticket(flight_num).print_ticket
    when 7
      puts "Exit"
      #input = false
    else
      puts "Please enter one of the avaliable options"
    end
  end

  #Ask the Passenger for their personal info
  def get_passenger_info
    info = []
    puts "Please enter your First Name:"
    info << gets.chomp
    puts "Please enter your Last Name:"
    info << gets.chomp
    puts "Please enter your Passport Number:"
    info << gets.chomp.to_i
  end

  def random_number_generator
    1 + rand(10000 + 1)
  end

  def musk_method
    mars_flight = Flight.create(name: "SpaceX", departure_time: "Model 3's first", seat: "1", meal: true, zone: "The Only Class",
                 start_location: "Cape Canaveral, FL", end_location: "Mars", flight_number: 1)

    elon = Passenger.create(first_name: "Elon", last_name: "Musk", passport_num: 1)

    Ticket.create(ticket_num: random_number_generator, passenger_id: elon.id, flight_id: mars_flight.id).print_ticket
  end
end
