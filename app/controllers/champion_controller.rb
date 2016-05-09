class ChampionController < ApplicationController
  def show

    @champion = params[:champion]

    championinfo = ChampionMasterie
                       .select(
                           'champion, SUM(points) AS sumpoints, AVG(points) AS avgpoints, MAX(points) AS maxpoints, ' +
                               'SUM(level) AS sumlvl, AVG(level) AS avglvl '
                       )
                       .group(:champion)
                       .order('sum(points) desc')

    champid = RiotAPI::StaticData.get_champion_by_name(@champion)['key'].to_i

    championinfo.each_with_index do |champion, index|
      if champion.champion == champid
        @championdata = champion
        @place = index + 1
      end
    end


  end
end
