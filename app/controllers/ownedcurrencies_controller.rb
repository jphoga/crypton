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
    unless ownedcurrency_params[:quantity].empty? || ownedcurrency_params[:cryptocurrency_id].empty?
      @cryptocurrency = Cryptocurrency.find( ownedcurrency_params[:cryptocurrency_id])
    end
    if @portfolio.cryptocurrencies.include?(@cryptocurrency)
      @ownedcurrency = update(@portfolio, @cryptocurrency)
    else
      @ownedcurrency = Ownedcurrency.new(ownedcurrency_params)
      @ownedcurrency.portfolio = @portfolio
    end
    authorize @ownedcurrency
    if @ownedcurrency.save
      @piedata ={}
      @portfolio.ownedcurrencies.each do |oc|
        @piedata[oc.cryptocurrency.name] = oc.cryptocurrency.total_owned_value(oc)
      end
      @ownedcurrency = Ownedcurrency.new
      respond_to do |format|
        format.html { render template: "portfolios/index"}
      end
    else
      @piedata ={}
      @portfolio.ownedcurrencies.each do |oc|
        @piedata[oc.cryptocurrency.name] = oc.cryptocurrency.total_owned_value(oc)
      end
      render "portfolios/index"
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

  def update(portfolio, cryptocurrency)
    @ownedcurrency = portfolio.ownedcurrencies.find_by(cryptocurrency: cryptocurrency)
    @ownedcurrency.quantity +=  ownedcurrency_params[:quantity].to_i
    @ownedcurrency
  end

end
