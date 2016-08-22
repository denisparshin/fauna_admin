class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :metatag, dependent: :destroy
  has_one :slider, as: :sliderable, dependent: :destroy
  has_many :sub_products, dependent: :destroy
  has_many :comments, as: :commentable

  scope :by_catalog_id, -> (catalog_ids) {
    joins(category: :catalog).where("catalogs.id" => catalog_ids) if catalog_ids
  }

  scope :by_category_id, -> (category_ids){
    joins(:category).where("categories.id" => category_ids) if category_ids
  }

  scope :index, -> (search) {
    includes(:sub_products, slider: :pictures, category: :catalog)
    .by_catalog_id(search.catalog_id)
    .by_category_id(search.category_id)
  }

  accepts_nested_attributes_for :metatag
end
