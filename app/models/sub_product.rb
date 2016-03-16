class SubProduct < ActiveRecord::Base
  has_and_belongs_to_many :filter_values
  belongs_to :product
end
