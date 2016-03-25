class SubProduct < ActiveRecord::Base
  has_and_belongs_to_many :filter_values
  belongs_to :product

  scope :with_products, -> (product_ids) { where(product_id: product_ids) if product_ids }
  scope :index, -> (search) { with_products(search.product_ids) }
end
