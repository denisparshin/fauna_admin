class Api::ProductSerializer < ApiSerializer
  attributes :id, :name

  def index 
    [:sub_products, :pictures, :catalog, :category]
  end

  def show
    [ :title, 
      :category_id, 
      :description, 
      :metatag_id, 
      :slug, 
      :slider,
      :metatag_attributes,
      :to_edit,
    ] 
  end

  def metatag_attributes
    if object.metatag
      serialize_object object.metatag, Api::MetatagSerializer, {scope: :in_product}
    else
      {keywords: nil, description: nil}
    end
  end

  def slider
    serialize_object object.slider, Api::SliderSerializer, {scope: :in_product}
  end

  def category
    serialize_object object.category, Api::CategorySerializer, {scope: :in_products}
  end

  def sub_products
    serialize_objects object.sub_products, Api::SubProductSerializer, {scope: :in_products}
  end

  def pictures
    object.slider.try(:pictures).to_a.map{|p| [ENV["ORIGIN_URL"], p.file.big.url].join('/') }
  end
end
