class Rooms

  attr_reader :room_name, :capacity, :guests
  attr_accessor :playlist, :tab

  def initialize(room_name,capacity)
    @room_name = room_name
    @capacity = capacity
    @guests = []
    @playlist = []
    @tab = 0
  end

  def num_of_guests
    return @guests.count
  end

  def add_guest(guest)
    @guests.push(guest)
  end

  def remove_guest(guest)
    @guests.delete(guest)
  end

  def song_count
    @playlist.count
  end

  def add_songs_to_playlist(song)
    @playlist.push(song)
  end

  def remove_songs_from_playlist(song)
    @playlist.delete(song)
  end

  def list_playlist
    list = @playlist.map{|song| "#{song.song_name} by #{song.artist}" }
    return list
  end

  def check_in(guest)
      @guests.push(guest)
  end

  def check_out(guest)
    @guests.delete(guest)
  end
end
