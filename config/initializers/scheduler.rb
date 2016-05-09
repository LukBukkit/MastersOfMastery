require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

if $server_mode == 1

  s.in '2s' do
    puts 'Loading Riot static data...'
    load("#{Rails.root}/lib/riotapi/static_data.rb")
    RiotAPI::StaticData.pull
    puts 'Loading Riot static data finished!'
  end

  s.every '15m' do
    puts 'Reading new masteries...'

    load "#{Rails.root}/lib/riotapi/masteries_updater.rb"
    MasteriesUpdater.update

    puts 'Done reading new masteries!'
  end
end