class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :metatag, dependent: :destroy
  has_one :slider, as: :sliderable, dependent: :destroy
  has_many :sub_products, dependent: :destroy
  has_many :comments, as: :commentable
end
