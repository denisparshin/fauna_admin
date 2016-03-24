class Api::SliderSerializer < ApiSerializer
  attributes :pictures, :primary_pic_id

  def pictures
    serialize_objects object.pictures, Api::PictureSerializer
  end
end
