class ChampionController < ApplicationController
  def show
    @champion = params[:champion]
  end
end
