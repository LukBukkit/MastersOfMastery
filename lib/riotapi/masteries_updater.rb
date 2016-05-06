module MasteriesUpdater

  attr_accessor :last_updated

  def self.update

    load "#{Rails.root}/lib/riotapi.rb"
    load "#{Rails.root}/lib/riotapi/summoner.rb"

    @last_updated = Time.now.getutc

    games = RiotAPI.get_featured_games['gameList']

    players = Array.new
    it1 = 0

    games.each do |game|
      game['participants'].each do |player|
        if it1 >= 35 then
          break
        end
        if player['bot'] then
          next
        end
        players.push(player['summonerName'].delete(' ').downcase)
        it1 += 1
      end
    end

    summonersids = RiotAPI.get_summoner_ids(players)
    if summonersids == nil then
      return
    end
    summoners = Hash.new

    summonersids.each do |key, value|
      exists = !QueriedUser.find_by(:leagueid => value['id']).nil?
      if exists
        summonersids.delete(key)
        next
      end
      summoners[value['id'].to_i] = Summoner.new(value['id'], value['name'])
    end

    count = (summoners.count / 10).ceil
    count.times do |i|
      partofsmn = summoners.keys[i * 10, 10]
      leagues = RiotAPI.get_summoner_leagues(partofsmn)
      leagues.each do |key, value|
        summoners[key.to_i].tier = value[0]['tier']
      end
    end

    summoners.each_value do |value|
      user = ::QueriedUser.new(:leagueid => value.id, :name => value.name, :elo => value.tier)
      user.save
      masteries = RiotAPI.get_championmastery_all_champs(value.id)
      masteries.each do |mastery|
        sqlmastery = ::ChampionMasterie.new(
            :champion => mastery['championId'],
            :points => mastery['championPoints'],
            :level => mastery['championLevel']
        )
        sqlmastery.save
      end
    end
  end

  def self.lastestUpdate

  end
end