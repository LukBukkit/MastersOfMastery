namespace :riot_tasks do
  desc 'Updates the championsmateries using the RiotAPI'
  task championpoints_task: :environment do
    puts 'Reading new masteries...'

    load "#{Rails.root}/lib/riotapi/masteries_updater.rb"
    MasteriesUpdater.update

    puts 'Done reading new masteries!'
  end

end
