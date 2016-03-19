class Api::SubProductSerializer < ApiSerializer
  attributes :id

  def in_products
    [:price]
  end
end
