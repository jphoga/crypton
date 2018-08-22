class OwnedcurrenciesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :destroy]

  def index
  end

  def show
  end

  def new
    # @ownedcurrency = Ownedcurrency.new
    # currencies = Cryptocurrency.all
    # @currencies = []

    # currencies.each do |currency|
    #   @currencies << currency.name
    # end
    # @currencies.sort!
  end

  def create

    @portfolio = Portfolio.find(params[:portfolio_id])
    @ownedcurrency = Ownedcurrency.new(ownedcurrency_params)
    @ownedcurrency.portfolio = @portfolio
    authorize @ownedcurrency

    if @ownedcurrency.save
      redirect_to portfolio_path
    end
  end

  def destroy
    @ownedcurrency = Ownedcurrency.find(params[:id])
    authorize @ownedcurrency
    @ownedcurrency.destroy


    redirect_to portfolio_path
  end


  private

  def ownedcurrency_params
    params.require(:ownedcurrency).permit(:quantity, :cryptocurrency_id, :portfolio_id)
  end

end
