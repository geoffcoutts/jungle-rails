class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :product, presence: true
  validates :user, presence: true
  validates :description, presence: { if: -> { rating.blank? } }
  validates :rating, presence: { if: -> { description.blank? } }
end
