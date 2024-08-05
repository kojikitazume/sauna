class SaunasController < ApplicationController
  def index
    @saunas = Sauna.all

    # 検索機能
    if params[:query].present?
      @saunas = @saunas.where('name ILIKE ? OR location ILIKE ? OR sauna_temperature::text ILIKE ? OR water_temperature::text ILIKE ? OR rolyu ILIKE ? OR aufguss ILIKE ? OR has_hot_spring ILIKE ?',
                              "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
    end

    # フィルタリング機能
    if params[:temperature_min].present?
      @saunas = @saunas.where('sauna_temperature >= ?', params[:temperature_min])
    end

    if params[:temperature_max].present?
      @saunas = @saunas.where('sauna_temperature <= ?', params[:temperature_max])
    end

    if params[:location].present?
      @saunas = @saunas.where('location ILIKE ?', "%#{params[:location]}%")
    end

    if params[:has_hot_spring].present?
      @saunas = @saunas.where(has_hot_spring: params[:has_hot_spring])
    end

    if params[:rolyu].present?
      @saunas = @saunas.where(rolyu: params[:rolyu])
    end

    if params[:aufguss].present?
      @saunas = @saunas.where(aufguss: params[:aufguss])
    end
  end

  def show
    @sauna = Sauna.find(params[:id])
    @sauna_visit = SaunaVisit.new
    @average_times = @sauna.sauna_visits
                           .select('AVG(sauna_time) as avg_sauna_time, 
                                    AVG(water_time) as avg_water_time, 
                                    AVG(cooldown_time) as avg_cooldown_time')
                           .take
  end
end
