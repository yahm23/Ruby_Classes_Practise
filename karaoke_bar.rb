class KaraokeBar

  attr_reader :name, :rooms , :songs_available, :till

  def initialize(name,rooms,songs_available)
    @name = name
    @rooms = rooms
    @songs_available = songs_available
    @till = 500
  end


  def add_songs_to_room_playlist(room,song)
    room.add_songs_to_playlist(song)
  end

  def remove_songs_from_rooms_playlist(room,song)
    room.remove_songs_from_playlist(song)
  end

  def check_in(room,guest)
    if guest.wallet > 10
      if room.num_of_guests < room.capacity
        charge_person(guest)
        room.add_guest(guest)
        #Will cap at capacity and charge people
      end
    end
  end

  def check_out(room,guest)
    room.remove_guest(guest)
  end
  #
  def charge_person(guest)
    guest.buy_entry
    @till += 10
  end

  def tab_set(room,amount)
    room.tab = amount
    @till += amount
  end

  def tab_check_in(room,guest)
    if room.tab >= 10
      room.tab -= 10
      room.add_guest(guest)
    end
  end



end
