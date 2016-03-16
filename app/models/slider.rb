class Slider < ActiveRecord::Base
  belongs_to :sliderable, polymorphic: true
  has_many :pictures, as: :imageable
end
