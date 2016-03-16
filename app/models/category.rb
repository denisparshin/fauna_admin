class Category < ActiveRecord::Base
  belongs_to :metatag, dependent: :destroy
  belongs_to :catalog
  has_many :products, dependent: :nullify
end
