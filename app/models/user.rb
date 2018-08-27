class User < ApplicationRecord
  acts_as_favoritor
  acts_as_voter
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :cryptocurrencies, through: :subscriptions
  has_one :portfolio, dependent: :destroy
  after_create :create_portfolio

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def create_portfolio
    Portfolio.create(user: self)
  end

  mount_uploader :photo, PhotoUploader
end
