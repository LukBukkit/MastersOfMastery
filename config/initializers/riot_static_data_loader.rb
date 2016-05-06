puts 'Loading Riot static data...'
load("#{Rails.root}/lib/riotapi/static_data.rb")
RiotAPI::StaticData.pull
puts 'Loading Riot static data finished!'