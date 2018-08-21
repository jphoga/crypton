class PortfolioController < ApplicationController
  # before_action :set_portfolio, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @portfolio = policy_scope(Portfolio)[0]
    @ownedcurrencies = Ownedcurrency.where(portfolio: @portfolio)

  end

  def destroy
    @post.destroy
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
    authorize @post
  end
end
