# require_relative './Booking.rb'

require_relative './DashBoard.rb'


class User

    def initialize(phone)
        @name = ""
        @phone = phone
        @address = ""
    end 

    def checkIn
        
        puts "Enter your name "
        @name = gets.chomp()
        puts "Enter address"
        @address = gets.chomp()

        # book = Booking.new 
        # room = book.createBooking()

        room = displayRooms

        File.open("./residents.txt","a") do |file|
        file.write("#{@phone}   #{room.name}\n")
        end
        $residents[@phone] = room 

    end

    def checkOut
        $residents[@phone].occupied = 0
        $residents.delete(@phone) 
        # need optimization
        File.delete("./residents.txt")
        File.open("./residents.txt","a") do |file|
            $residents.each do |phone,room|
                file.write("#{phone}\t#{room.name}\n")
            end
        end
    end


end 





