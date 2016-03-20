class Api::CategorySerializer < ApiSerializer
  attributes :id

  def index 
    [:name]
  end

  def show
    [:id, :name, :slug]
  end

end
