require('minitest/autorun')
require('minitest/rg')
require_relative('../guests.rb')
require_relative('../karaoke_bar.rb')
require_relative('../rooms.rb')
require_relative('../songs.rb')


class TestSongs < MiniTest::Test

  def setup
    @song1 = Songs.new("Toxic", "Britney Spears")
    @song2 = Songs.new("Gold-digger", "Kanye West")
    @song3 = Songs.new("Hey Ya", "Outkast")
    @song4 = Songs.new("Smooth Criminal", "Michael Jackson")

    @all_songs =[@song1,@song2,@song3,@song4]

    # @playlist1=[@song1,@song2,@song3]
    # @playlist2=[@song2,@song3,@song4]

    @guest1 = Guests.new("Yousef", 40, "Hey Ya")
    @guest2 = Guests.new("Jack", 50, "")
    @guest3 = Guests.new("Mark", 30, "")
    @guest4 = Guests.new("Edd", 0, "")


    @room1 = Rooms.new("Big Room", 5)
    @room2 = Rooms.new("Medium Room", 4)
    @room3 = Rooms.new("Small Room", 3)

    @all_rooms = [@room1,@room2,@room3]

    @karaoke_bar = KaraokeBar.new("Edi's Best Karaoke Bar", @all_rooms,@all_songs)

  end


  def test_song_name
    assert_equal("Hey Ya", @song3.song_name)
  end

  def test_artist_name
    assert_equal("Outkast", @song3.artist)
  end

end
