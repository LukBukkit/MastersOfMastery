class ChampionController < ApplicationController
  def show
    @stuff = params[:champion]
  end
end
