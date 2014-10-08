require 'json'
require 'open-uri'
require 'pry'

class SpotifyChart

  attr_reader :base_url

  def initialize
    @base_url = "http://charts.spotify.com/api/charts/"
  end

  def get_url(preference, region)
    # return a string that is the base url + / + preference + / + region + / + latest
    string = "#{@base_url}#{preference}/#{region}/latest"
    # binding.pry
  end

  def get_json(url)
    # load json given a url here
    # refer to the references if you have questions about this
    spotify_json = JSON.load(open(url))

  end

  def fetch_track_album_artist(music_hash)
    # binding.pry
    info = music_hash["tracks"]
    artist = info[0]["artist_name"]
    album = info[0]["album_name"]
    song = "'#{info[0]["track_name"]}'"


    result = "#{song} by #{artist} from the album #{album}"
    # binding.pry
    # example music_hash:
    # {  
    #   "tracks" => [  
    #     {  
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"All About That Bass",
    #       "artist_name"  =>"Meghan Trainor",
    #       "album_name"   =>"Title"
    #     },
    #     {  
    #       "date"         =>"2014-09-14",
    #       "track_name"   =>"Break Free",
    #       "artist_name"  =>"Ariana Grande",
    #       "album_name"   =>"Break Free"
    #     }
    #   ]
    # }

    # given a hash, like the one above, this method should return a string like:
    # '<track name>' by <artist name> from the <album name>
  
    # the track name, artist name, and album name should be the first track in the
    # tracks array
  end


  def most_streamed(region)
    url = get_url('most_streamed','us')
    # binding.pry
    # call no get_url here, where preference is the string 'most_streamed',
    # and set it equal to a variable
    spotify_json = get_json(url)
    # call on get_json here, using the string that get_url returns
    fetch_track_album_artist(spotify_json)
    # finally, call on fetch_track_album_artist using the 
    # hash that get_json returns
  end

  def most_shared(region)
    # call no get_url here, where preference is the string 'most_shared',
    # and set it equal to a variable
    url = get_url('most_shared', 'us')
    # call on get_json here, using the string that get_url returns
    json = get_json(url)
    # finally, call on fetch_track_album_artist using the 
    # hash that get_json returns
    fetch_track_album_artist(json)
  end

end
