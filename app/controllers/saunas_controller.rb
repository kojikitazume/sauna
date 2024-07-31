class SaunasController < ApplicationController
  def index
    @saunas = Sauna.all
  end

  def show
    @sauna = Sauna.find(params[:id])
    @sauna_visit = SaunaVisit.new
    @average_times = @sauna.sauna_visits.select('AVG(sauna_time) as avg_sauna, AVG(water_time) as avg_water, AVG(cooldown_time) as avg_cooldown').first
  end
end
