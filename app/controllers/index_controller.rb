class IndexController < ApplicationController
  def show
    load "#{Rails.root}/lib/riotapi.rb"

    @masteries = ChampionMasterie
                     .select(
                         'champion, SUM(points) AS sumpoints, AVG(points) AS avgpoints, MAX(points) AS maxpoints, ' +
                             'SUM(level) AS sumlvl, AVG(level) AS avglvl '
                     )
                     .group(:champion)
                     .order('sum(points) desc')

  end
end
