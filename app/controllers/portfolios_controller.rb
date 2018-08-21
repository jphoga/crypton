class PortfoliosController < ApplicationController
  # before_action :set_portfolio, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @portfolios = policy_scope(Portfolio)
    @portfolio = @portfolios.find_by(user: current_user)
    @ownedcurrencies = Ownedcurrency.where(portfolio: @portfolio)
  end

  def destroy
    if @portfolio.destroy
      redirect_to home_path
    else
      render new
    end

  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
    authorize @post
  end
end
