class Api::ProductSerializer < ApiSerializer
  attributes :id

  def index 
    [:id, :name]
  end

  def show
    [:id, :name, :slug]
  end

end
