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



  def run
    greet
    puts ""
    menu
  end

end
