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
    puts "To exit, type 'exit'"
  end

  def run
    greet
    puts ""
    menu
  end

  def show_all_flights
    Flight.all.each do |flight|
      puts "|---------------------------------------|"
      puts "| Airline     | #{flight.name}"
      puts "|---------------------------------------|"
      puts "| Board Time  | #{flight.boarding_time}"
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

  def show_all_passengers_flights(last_name, first_name)
    my_flights = Passenger.find_by(last_name: last_name, first_name: first_name)
    my_flights.flights
  end


end
