module RiotAPI
  module StaticData
    @language = 'en_US'

    def self.pull
      datasres = RestClient.get('https://ddragon.leagueoflegends.com/realms/euw.json')
      datas = MultiJson.load(datasres)
      @version = datas['v']
      @cdn = datas['cdn']
      @data = Hash.new
      datas['n'].each do |key, value|
        @data[key] = pull_data(key)
      end
      parse_champions
    end

    private
    def self.pull_data(data_name)
      url = "#{@cdn}/#{@version}/data/#{@language}/#{data_name}.json"
      MultiJson.load(RestClient.get(url))
    end

    private
    def self.parse_champions
      @chdata = @data['champion']['data']
      @chidtoname = Hash.new
      @chdata.each do |key, value|
        @chidtoname[value['key'].to_i] = key
      end
    end

    def self.get_champion_by_id(id)
      get_champion_by_name(@chidtoname[id.to_i])
    end

    def self.get_champion_hash_name_by_id(id)
      get_champion_by_id(id)['id']
    end

    def self.get_champion_name_by_id(id)
      ret = get_champion_by_id(id)
      ret['name']
    end

    def self.get_champion_by_name(name)
      @chdata[name.to_s]
    end

    def self.get_champ_icon(name)
      "#{@cdn}/#{@version}/img/champion/#{@chdata[name.to_s]['image']['full']}"
    end

    def self.get_champ_icon_id(id)
      "#{@cdn}/#{@version}/img/champion/#{get_champion_by_id(id)['image']['full']}"
    end

  end
end