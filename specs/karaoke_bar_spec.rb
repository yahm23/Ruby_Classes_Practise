require('minitest/autorun')
require('minitest/rg')
require_relative('../guests.rb')
require_relative('../karaoke_bar.rb')
require_relative('../rooms.rb')
require_relative('../songs.rb')


class TestKaraokeBar < MiniTest::Test
  def setup
    @song1 = Songs.new("Toxic", "Britney Spears")
    @song2 = Songs.new("Gold-digger", "Kanye West")
    @song3 = Songs.new("Hey Ya", "Outkast")
    @song4 = Songs.new("Smooth Criminal", "Michael Jackson")

    @all_songs =[@song1,@song2,@song3,@song4]


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

  def test_karaoke_bar_name
    assert_equal("Edi's Best Karaoke Bar", @karaoke_bar.name)
  end

  def test_karaoke_bar_rooms
    assert_equal(@all_rooms,@karaoke_bar.rooms)
  end

  def test_karaoke_bar_songs_selection
    assert_equal(@all_songs,@karaoke_bar.songs_available)
  end

  def test_add_songs_to_certain_rooms_playlist
    @karaoke_bar.add_songs_to_room_playlist(@room1,@song2)
    @karaoke_bar.add_songs_to_room_playlist(@room1,@song3)
    playlist = ["Gold-digger by Kanye West", "Hey Ya by Outkast"]
    assert_equal(playlist,@room1.list_playlist)
  end


  def test_remove_songs_from_certain_rooms_playlist
    @karaoke_bar.add_songs_to_room_playlist(@room1,@song2)
    @karaoke_bar.add_songs_to_room_playlist(@room1,@song3)
    @karaoke_bar.add_songs_to_room_playlist(@room1,@song1)
    @karaoke_bar.remove_songs_from_rooms_playlist(@room1,@song2)
    playlist = ["Hey Ya by Outkast","Toxic by Britney Spears"]
    assert_equal(playlist,@room1.list_playlist)
  end

  def test_check_in_guest_to_room_within_capacity
    @karaoke_bar.check_in(@room1,@guest1)
    @karaoke_bar.check_in(@room1,@guest2)
    @karaoke_bar.check_in(@room1,@guest3)
    assert_equal(3,@room1.num_of_guests)
  end

  def test_check_in_guest_to_room_over_capacity
    @karaoke_bar.check_in(@room3,@guest1)
    @karaoke_bar.check_in(@room3,@guest2)
    @karaoke_bar.check_in(@room3,@guest3)
    @karaoke_bar.check_in(@room3,@guest4)
    assert_equal(3,@room3.num_of_guests)
  end

  def test_check_out_guest_from_room
    @karaoke_bar.check_in(@room1,@guest1)
    @karaoke_bar.check_in(@room1,@guest2)
    @karaoke_bar.check_in(@room1,@guest3)
    @karaoke_bar.check_out(@room1,@guest3)
    assert_equal(2,@room1.num_of_guests)
  end

  def test_check_in_guest_to_room_with_money_transfer
    @karaoke_bar.check_in(@room3,@guest1)
    @karaoke_bar.check_in(@room3,@guest2)
    @karaoke_bar.check_in(@room3,@guest3)
    assert_equal(3,@room3.num_of_guests)
    assert_equal(530, @karaoke_bar.till)
    assert_equal(20, @guest3.wallet)
  end

  def test_tab_check
    @karaoke_bar.tab_set(@room1,20)
    @karaoke_bar.tab_check_in(@room1,@guest1)
    @karaoke_bar.tab_check_in(@room1,@guest2)
    assert_equal(520, @karaoke_bar.till)
    assert_equal(40, @guest1.wallet)
    assert_equal(0, @room1.tab)

  end

end
