class Api::PictureSerializer < ApiSerializer
  attributes :id, :url

  def url 
    # TODO fix this kostyl'
    domain = File.exists?(Rails.root.join("public/#{object.file.url}")) ? "http://localhost:3000" : ENV["ORIGIN_URL"]
    [domain, object.file.url].join("/") if object.file
  end
end
