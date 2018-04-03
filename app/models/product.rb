class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews, :dependent => :destroy

  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, presence: true
  validates :category, presence: true

  def average_review
    average_review = reviews.average(:rating)
    if average_review
      average_review.round(2)
    else
      0
    end
  end

end
