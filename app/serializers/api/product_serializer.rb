class Api::ProductSerializer < ApiSerializer
  attributes :id

  def index 
    [:id, :name, :sub_products]
  end

  def show
    [:id, :name, :slug]
  end

  def sub_products
    serialize_objects object.sub_products, Api::SubProductSerializer, {scope: :in_products}
  end

end
