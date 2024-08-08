class SaunasController < ApplicationController
  def index
    @saunas = Sauna.all

    if params[:query].present?
      @saunas = @saunas.where('name ILIKE ? OR location ILIKE ?',
                              "%#{params[:query]}%", "%#{params[:query]}%")
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
      @saunas = @saunas.where(has_hot_spring: params[:has_hot_spring] == 'true')
    end

    if params[:rolyu].present?
      @saunas = @saunas.where(rolyu: params[:rolyu] == 'true')
    end

    if params[:aufguss].present?
      @saunas = @saunas.where(aufguss: params[:aufguss] == 'true')
    end

    @featured_saunas = Sauna.where(featured: true).limit(5)

    # 最新のサ活を5件取得
    @latest_posts = SaunaVisit.order(created_at: :desc).limit(5)
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
