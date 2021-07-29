class Item < ApplicationRecord
  validates :size, :width, :weight, :length, :height, numericality: {greater_than: 0}
  validates :dispatch, :destination, presence: true
end
