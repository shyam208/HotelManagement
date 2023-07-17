$availableRooms = []
require_relative('./Rooms.rb')

def displayRooms
    choices = []
    puts "Press 1 if you want Ac , Press 0 if you dont want AC"
     choice = gets.to_i
     choices << choice
    puts "Press 1 if you want DoubleBed , Press 0 if you dont want SingleBed"
     choice = gets.to_i
     choices << choice
    puts "Press 1 if you want Balcony , Press 0 if you dont want Balcony"
     choice = gets.to_i
     choices << choice
     $availableRooms = []
     $rooms.each do |i|
       if i.instance_variable_get(:@ac) == choices[0] && i.instance_variable_get(:@BedType)== choices[1] && i.instance_variable_get(:@Balcony) == choices[2] && i.instance_variable_get(:@occupied) == 0
         puts "RoomNo=>#{i.instance_variable_get(:@name)} , cost = #{i.instance_variable_get(:@cost)}"
         $availableRooms << i
       end
     end
     if $availableRooms.empty?()
       puts "no rooms available"
       hotelBooking()
     else
      selectingRoom
     end
end

def selectingRoom
  puts "enter roomNumber you want to select"
  puts "enter zero to go to main menu"
  inputUser = gets.to_i
  if inputUser == 0
    hotelBooking()
  end
  f = 0
  $availableRooms.each do |i|
    if i.instance_variable_get(:@name) == inputUser
       i.instance_variable_set(:@occupied, 1)
       f = 1
       cost = i.instance_variable_get(:@cost) 
       return i
    end
  end
  if f == 0
    puts "wrong input delivered"
    selectingRoom
  end

end


