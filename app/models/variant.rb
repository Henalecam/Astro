class Variant < ApplicationRecord
  belongs_to :product

  validates :name, :price, presence: true
end
