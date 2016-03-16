class Catalog < ActiveRecord::Base
  belongs_to :metatag, dependent: :destroy
  has_many :categories, dependent: :nullify
end
