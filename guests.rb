class Guests

  attr_reader :name, :wallet

  def initialize(name, wallet,fav_song)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
  end


  def buy_entry
    @wallet -= 10
  end


  def cheer_for_song(playlist)
    song_names = playlist.map{|song| song.song_name}
    for song in song_names
      if song == @fav_song
        return "Woo"
      end
    end
  end




end
