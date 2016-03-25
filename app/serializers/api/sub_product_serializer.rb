class Api::SubProductSerializer < ApiSerializer
  attributes :id

  def index 
    [:id,
     :sku,
     :name,
     :price,
     :visible,
     :avail,
     :count]
  end

  def in_products
    [:price, :sku, :name]
  end
end
