# frozen_string_literal: true

class SaunasController < ApplicationController
  include Gon::ControllerHelpers

  def index
    @saunas = Sauna.all
    gon.saunas = @saunas.as_json(only: %i[name latitude longitude])

    if params[:query].present?
      @saunas = @saunas.where('name ILIKE ? OR location ILIKE ?',
                              "%#{params[:query]}%", "%#{params[:query]}%")
    end

    # フィルタリング機能
    @saunas = @saunas.where('sauna_temperature >= ?', params[:temperature_min]) if params[:temperature_min].present?

    @saunas = @saunas.where('sauna_temperature <= ?', params[:temperature_max]) if params[:temperature_max].present?

    @saunas = @saunas.where('location ILIKE ?', "%#{params[:location]}%") if params[:location].present?

    @saunas = @saunas.where(has_hot_spring: params[:has_hot_spring] == 'true') if params[:has_hot_spring].present?

    @saunas = @saunas.where(rolyu: params[:rolyu] == 'true') if params[:rolyu].present?

    @saunas = @saunas.where(aufguss: params[:aufguss] == 'true') if params[:aufguss].present?

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

  # サウナ施設の新規作成用のアクション
  def new
    @sauna = Sauna.new
  end

  # サウナ施設の登録用のアクション
  def create
    @sauna = Sauna.new(sauna_params)
    if @sauna.save
      redirect_to sauna_path(@sauna), notice: 'サウナ施設が登録されました。'
    else
      render :new
    end
  end

  private

  # サウナ施設のパラメータを許可
  def sauna_params
    params.require(:sauna).permit(:name, :location, :image, :sauna_temperature, :water_temperature, :description, :has_hot_spring, :rolyu, :aufguss)
  end
end
