class SaunaVisitsController < ApplicationController
  def create
    @sauna_visit = current_user.sauna_visits.build(sauna_visit_params)
    if @sauna_visit.save
      redirect_to @sauna_visit.sauna, notice: 'サ活を記録しました！'
    else
      redirect_to @sauna_visit.sauna, alert: 'サ活の記録に失敗しました。'
    end
  end

  private

  def sauna_visit_params
    params.require(:sauna_visit).permit(:sauna_id, :sauna_time, :water_time, :cooldown_time, :comment)
  end
end
