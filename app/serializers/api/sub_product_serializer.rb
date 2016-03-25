class Api::SubProductSerializer < ApiSerializer
  attributes :id

  def index 
    [:id,
     :sku,
     :name,
     :description,
     :price,
     :visible,
     :avail,
     :count]
  end

  def in_products
    [:price, :sku, :name]
  end
end
