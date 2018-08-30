class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @portfolio = policy_scope(Portfolio)
    # @portfolio = @portfolios.find_by(user: current_user)

    #create new ownedcurrency
    @ownedcurrency = Ownedcurrency.new
    @piedata ={}
    @portfolio.ownedcurrencies.each do |oc|
      @piedata[oc.cryptocurrency.name] = oc.cryptocurrency.total_owned_value(oc)
    end

    respond_to do |format|
      format.js
      # format.html { render :new }
    end

  end


  def destroy
    if @portfolio.destroy
      redirect_to home_path
    else
      render :new
    end

  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
    authorize @post
  end

end
