# frozen_string_literal: true

class BookmarksController < ApplicationController
  def create
    @sauna = Sauna.find(params[:sauna_id])
    current_user.bookmarks.create(sauna: @sauna)
    redirect_to @sauna, notice: 'サウナを保存しました。'
  end

  def destroy
    @sauna = Sauna.find(params[:sauna_id])
    current_user.bookmarks.find_by(sauna: @sauna).destroy
    redirect_to @sauna, notice: 'サウナの保存を解除しました。'
  end
end
