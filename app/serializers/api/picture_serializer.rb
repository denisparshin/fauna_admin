class Api::PictureSerializer < ApiSerializer
  attributes :id, :description, :url

  def url 
    object.file.url if object.file
  end
end
