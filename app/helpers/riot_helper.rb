module RiotHelper
  load "#{Rails.root}/lib/riotapi.rb"

  def riot_champion_icon_id(id)
    RiotAPI::StaticData.get_champ_icon_id(id)
  end

  def riot_champion_name_id(id)
    RiotAPI::StaticData.get_champion_name_by_id(id)
  end

  def riot_champion_url_name(id)
    RiotAPI::StaticData.get_champion_hash_name_by_id(id)
  end

  def link_to_champion(id, css_classes = '')
    link_to riot_champion_name_id(id),
            {:controller => :champion,
             :action => :show,
             :champion => riot_champion_url_name(id)},
            class: css_classes
  end

end
