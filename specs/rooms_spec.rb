require('minitest/autorun')
require('minitest/rg')
require_relative('../guests.rb')
require_relative('../karaoke_bar.rb')
require_relative('../rooms.rb')
require_relative('../songs.rb')


class TestRooms < MiniTest::Test
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


  def test_room_name
    assert_equal("Medium Room", @room2.room_name)
    assert_equal("Small Room", @room3.room_name)
    assert_equal("Big Room", @room1.room_name)
  end

  def test_room_capacity
    assert_equal(5, @room1.capacity)
    assert_equal(4, @room2.capacity)
    assert_equal(3, @room3.capacity)
  end

  def test_num_of_guests
    assert_equal(0, @room1.num_of_guests)
  end

  def test_add_guest
    @room1.add_guest(@guest4)
    @room1.add_guest(@guest3)
    assert_equal(2,@room1.num_of_guests)
  end

  def test_remove_guest
    @room1.add_guest(@guest4)
    @room1.add_guest(@guest3)
    @room1.remove_guest(@guest3)
    assert_equal(1,@room1.num_of_guests)
  end

  def test_song_count
    assert_equal(0, @room1.song_count)
  end

  # def test_guest_check_in
  #   @room2.check_in(@guest1)
  #   @room2.check_in(@geust2)
  #   assert_equal(2, @room2.num_of_guests)
  # end
  #
  # def test_guest_check_out
  #   @room2.check_in(@guest1)
  #   @room2.check_in(@geust2)
  #   @room2.check_in(@geust3)
  #
  #   @room2.check_out(@geust3)
  #   assert_equal(2, @room2.num_of_guests)
  # end


end
