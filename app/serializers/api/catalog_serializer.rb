class Api::CatalogSerializer < ApiSerializer
  attributes :id, :name, :slug
  def index
    [:categories]
  end

  def categories
    serialize_objects(object.categories, Api::CategorySerializer, {scope: :index})
  end
end
