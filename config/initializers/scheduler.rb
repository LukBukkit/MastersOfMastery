require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

s.every '15m' do
  puts 'Reading new masteries...'

  load "#{Rails.root}/lib/riotapi/masteries_updater.rb"
  MasteriesUpdater.update

  puts 'Done reading new masteries!'
end