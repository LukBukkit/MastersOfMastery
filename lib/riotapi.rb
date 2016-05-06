module RiotAPI

  load "#{Rails.root}/lib/riotapi/static_data.rb"

  private
  def self.do_riot_request(method)
    url = "https://euw.api.pvp.net/#{method}"
    begin
      res = RestClient.get(url, :params => {:api_key => ENV['RIOT_API_KEY']})
      MultiJson.load(res.to_s)
    rescue => e
      #puts 'RestError: ' + e.response
      puts 'RestError: ' + e.class.name
      return nil
    end
  end

  def self.get_championmastery_all_champs(player)
    do_riot_request("championmastery/location/EUW1/player/#{player}/champions")
  end

  def self.get_featured_games
    do_riot_request('observer-mode/rest/featured')
  end

  def self.get_game_data(game)
    do_riot_request("api/lol/euw/v2.2/match/#{game}")
  end

  def self.get_summoner_ids(names)
    namesstr = URI::encode(names.join(','))
    do_riot_request("api/lol/euw/v1.4/summoner/by-name/#{namesstr}")
  end

  def self.get_summoner_leagues(ids)
    idsstr = URI::encode(ids.join(','))
    do_riot_request("api/lol/euw/v2.5/league/by-summoner/#{idsstr}")
  end

end