class Api::ProductSerializer < ApiSerializer
  attributes :id

  def index 
    [:id, :name, :sub_products, :pictures]
  end

  def show
    [:id, :name, :slug]
  end

  def sub_products
    serialize_objects object.sub_products, Api::SubProductSerializer, {scope: :in_products}
  end

  def pictures
    object.slider.try(:pictures).to_a.map{|p| [ENV["ORIGIN_URL"], p.file.big.url].join('/') }
  end
end
