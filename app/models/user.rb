class User < ApplicationRecord
  acts_as_favoritor
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :portfolio, dependent: :destroy
  after_create :create_portfolio

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def create_portfolio
    Portfolio.create(user: self)
  end
end
