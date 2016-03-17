class ApiSerializer < ActiveModel::Serializer
  def attributes
    super.merge fetch_attributes(self.try(serialization_options[:template].to_s).to_a)
  end

  def fetch_attributes(attributes=[])
    attributes.map{|a| [a, object.try(a)] }.to_h
  end
end
