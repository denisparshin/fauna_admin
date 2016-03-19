class Api::CategorySerializer < ApiSerializer
  attributes :id

  def index 
    [:name, :xoxoxo]
  end

  def show
    [:id, :name, :slug]
  end

end
