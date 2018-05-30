jon = Passenger.create(first_name: "Jon", last_name: "Brown", age: 21)
val = Passenger.create(first_name: "Val", last_name: "Hart", age: 35)
meg = Passenger.create(first_name: "Meg", last_name: "Griffin", age: 16)

Flight.create(name: "Emirates", boarding_time: "10:00", seat: "B1", meal: true, zone: "Economy",
              start_location: "Los Angeles", end_location: "Dubai", flight_number: 1354)
Flight.create(name: "American Airlines", boarding_time: "16:00", seat: "F9", meal: false, zone: "Economy",
              start_location: "New York", end_location: "Hanoi", flight_number: 783)
Flight.create(name: "Singapore Air", boarding_time: "02:00", seat: "3P", meal: true, zone: "First Class",
              start_location: "New York", end_location: "Shanghai", flight_number: 902)

Ticket.create(ticket_num: 29357, passenger_id: 1, flight_id: 2)
Ticket.create(ticket_num: 39475, passenger_id: 2, flight_id: 1)
Ticket.create(ticket_num: 28347, passenger_id: 3, flight_id: 3)