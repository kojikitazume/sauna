class SaunaVisitsController < ApplicationController
  def create
    @sauna_visit = SaunaVisit.new(sauna_visit_params)
    @sauna_visit.user = current_user # サウナ訪問者として現在のユーザーを設定
    @sauna_visit.sauna = Sauna.find(params[:sauna_id]) # 関連するサウナを設定

    if @sauna_visit.save
      redirect_to @sauna_visit.sauna, notice: 'サ活を記録しました！'
    else
      redirect_to @sauna_visit.sauna, alert: 'サ活の記録に失敗しました。'
    end
  end

  private

  def sauna_visit_params
    params.require(:sauna_visit).permit(:sauna_time, :water_time, :cooldown_time, :sauna_id)
  end
end
