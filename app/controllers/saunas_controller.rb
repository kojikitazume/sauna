class SaunasController < ApplicationController
  def index
    @saunas = Sauna.all
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
