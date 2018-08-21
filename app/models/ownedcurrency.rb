class Ownedcurrency < ApplicationRecord
  belongs_to :cryptocurrency
  belongs_to :portfolio
end
