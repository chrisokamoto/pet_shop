class CachorrosController < ApplicationController
  def index
    @search = CachorroSearch.new cachorro_search_params
    @cachorros  = @search.search
  end

  private

  def cachorro_search_params
    search_params = params.include?(:cachorro_search) ? params.require(:cachorro_search).permit(:query, :field, :order, :page) : {}
    search_params.merge(page: params[:page])
  end
end
