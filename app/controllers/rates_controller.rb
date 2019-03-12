class RatesController < ApplicationController
  before_action :authenticate_user!

  def index
   @rates = Rate.where(user: current_user).includes(:currency_from, :currency_to)
  end

  def create
    @rate = RateCreator.call(rate_params)
    if @rate.save
      flash[:notice] = 'Exchange rates successfully added'
      redirect_to rates_path
    else
      flash[:alert] = @rate.errors.messages
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @rate = Rate.find(params[:id])
    if @rate.destroy
      flash[:notice] = 'Exchange rates successfully deleted'
      redirect_to rates_path
    else
      flash[:alert] = @rate.errors.messages
      redirect_to rates_path
    end
  end

  private

  def rate_params
    merge_params = { user: current_user }
    params.require(:rate).permit(:currency_from_id, :currency_to_id).merge!(merge_params)
  end
end