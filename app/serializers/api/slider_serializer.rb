class Api::SliderSerializer < ApiSerializer
  attributes :id, :pictures, :primary_pic_id

  def pictures
    serialize_objects object.pictures.order(created_at: :asc), Api::PictureSerializer
  end
end
